package net.kazang.pegasus

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import com.google.gson.Gson
import com.prism.core.data.TransactionItem
import com.prism.core.domain.DeviceInformation
import com.prism.core.domain.FactoryConstructorData
import com.prism.core.domain.PosFactorySetup
import com.prism.core.domain.PrintRequest
import com.prism.core.domain.PrinterStatus
import com.prism.core.domain.TerminalSetup
import com.prism.core.domain.TransactionClientResponse
import com.prism.core.enums.CurrencyTypeEnum
import com.prism.core.enums.RoutingSwitchEnum
import com.prism.core.enums.ServiceConfigurationEnum
import com.prism.core.enums.TransactionClientActionEnum
import com.prism.core.enums.TransactionTypesEnum
import com.prism.core.helpers.FactoryTransactionBuilder
import com.prism.core.interfaces.FactoryActivityEvents
import com.prism.device.management.DeviceManagement
import com.prism.factory.BuildConfig
import com.prism.factory.datarepos.TransactionRepository
import com.prism.factory.factory.MockTransactionFactory
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel


class MockTransactionHandler : FactoryActivityEvents, TransactionInterface {

    private var factory: MockTransactionFactory? = null
    private var factoryConstructor: FactoryConstructorData? = null
    private var connected = false
    private lateinit var activity: Activity
    private var factorybb = FactoryTransactionBuilder()

    private var handler = Handler(Looper.getMainLooper())
    private var eventSink: EventChannel.EventSink? = null
    private var repo: TransactionRepository? = null

    override fun initialize(context: Context, config: TerminalConfig, proxy: Boolean) {
        activity = context as Activity
        if (factory == null) {
            factory = MockTransactionFactory(context)
        }
        val result = factory!!.getBuildAndSENumber()
        factory!!.dispose()

        if (result.requiredUpdate) {
            onOsUpdateRequired(result.buildNumber!!, result.seNumber!!)
        } else {
            try {
                setupFactory(context, config, proxy)
            } catch (e: Exception) {
                onFactoryInitialized()
            }
        }
    }

    private fun setupFactory(context: Activity, config: TerminalConfig, proxy: Boolean) {
        factoryConstructor = FactoryConstructorData()
        factoryConstructor!!.context = context
        factoryConstructor!!.p2peEnabled = true
        factoryConstructor!!.debugMode = BuildConfig.DEBUG
        factoryConstructor!!.serviceConfiguration = if (net.kazang.pegasus.BuildConfig.FLAVOR == "prod") {
            ServiceConfigurationEnum.PROD
        } else {
            ServiceConfigurationEnum.UAT
        }
        factoryConstructor!!.serviceTimeout = 60000
        factoryConstructor!!.proxyUrl = if (proxy) "proxy.kazang.net:30720" else null
        Log.d("Proxy", factoryConstructor!!.proxyUrl ?: "none")
        factoryConstructor!!.proxyUserName = null
        factoryConstructor!!.proxyPassword = null
        factoryConstructor!!.useSSLCerticates = false
        val terminalSetup = TerminalSetup()
        terminalSetup.terminalId = config.terminal_config.terminal_id
        terminalSetup.merchantId = config.merchant_config.merchant_number
        factoryConstructor!!.terminalSetup = terminalSetup
        factoryConstructor!!.useExternalConfiguration = true
        factoryConstructor!!.posFactorySetup = PosFactorySetup()
        factoryConstructor!!.posFactorySetup!!.currencyCode =
            CurrencyTypeEnum.fromCountryCodeString(config.terminal_config.currency_code)
        factoryConstructor!!.posFactorySetup!!.routingSwitch =
            RoutingSwitchEnum.valueOf(config.merchant_config.routing_switch)
        factoryConstructor!!.posFactorySetup!!.velocityCount = 10
        factoryConstructor!!.posFactorySetup!!.velocityPeriod = 5
        factoryConstructor!!.posFactorySetup!!.cashbackLimit =
            config.terminal_config.custom_parameters?.cashbacks?.limit?.toInt() ?: 1000
        factoryConstructor!!.posFactorySetup!!.automaticSettlementTime = "13:23"
        factoryConstructor!!.posFactorySetup!!.enableSettlements = true
        factoryConstructor!!.posFactorySetup!!.parameterDownloadTime = "13:23"
        factoryConstructor!!.posFactorySetup!!.primaryTermappIpAddress =
            config.termapp_config.primary_ip
        factoryConstructor!!.posFactorySetup!!.primaryTermappPort =
            config.termapp_config.primary_port
        factoryConstructor!!.posFactorySetup!!.secondaryTermappIpAddress =
            config.termapp_config.secondary_ip
        factoryConstructor!!.posFactorySetup!!.secondaryTermappPort =
            config.termapp_config.secondary_port
        factoryConstructor!!.posFactorySetup!!.pinKSN = config.termapp_config.pin_ksn
        factoryConstructor!!.posFactorySetup!!.dataKSN = config.termapp_config.data_ksn
        factoryConstructor!!.posFactorySetup!!.batchNo = "001"

        val enabledTransactions = ArrayList<TransactionTypesEnum>()
        if (config.terminal_config.custom_parameters?.cashbacks?.allowed!!) {
            enabledTransactions.add(TransactionTypesEnum.CASH_BACK)
        }
        if (config.terminal_config.custom_parameters?.refunds?.allowed!!) {
            enabledTransactions.add(TransactionTypesEnum.REFUND)
        }
        config.merchant_config.transaction_types.forEach {
            when (val type = it.uppercase()) {
                "VOID" -> {
                    enabledTransactions.add(TransactionTypesEnum.VOID_TRANSACTION)
                }

                "CASH_WITHDRAWAL" -> {
                    enabledTransactions.add(TransactionTypesEnum.CASH_WITH_DRAWAL)
                }

                "PURCHASE_WITH_CASHBACK" -> {
                    enabledTransactions.add(TransactionTypesEnum.PURCHASE_TIP)
                }

                else -> {
                    enabledTransactions.add(TransactionTypesEnum.valueOf(type))
                }
            }
        }
        factoryConstructor!!.posFactorySetup!!.enabledTransactions = enabledTransactions
        factory = MockTransactionFactory(factoryConstructor!!, this)
        onFactoryInitialized()
        repo = TransactionRepository(context)
    }

    override fun onListen(p0: Any?, sink: EventChannel.EventSink) {
        eventSink = sink
    }

    override fun onCancel(p0: Any?) {
        eventSink = null
    }

    override fun onBatteryStatusLowEvent(percentage: Int) {
        Log.d("onBatteryStatusLowEvent", percentage.toString())
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to percentage,
                    "event" to "onBatteryStatusLowEvent"
                )
            )
        }
    }

    override fun onConnectEvent(value: Boolean) {
        Log.d("onConnectEvent", value.toString())
        connected = true
    }

    override fun onDeviceInformationEvent(deviceInformation: DeviceInformation) {
        val gson = Gson()
        Log.d("onDeviceInformationEvent", deviceInformation.toString())
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to gson.toJson(deviceInformation),
                    "event" to "onDeviceInformationEvent"
                )
            )
        }
    }

    override fun onDisConnectEvent(value: Boolean) {
        Log.d("onDisConnectEvent", value.toString())
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to value,
                    "event" to "onDisConnectEvent"
                )
            )
        }
    }

    override fun onErrorEvent(value: String?) {
        Log.d("onErrorEvent", value!!)
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to value,
                    "event" to "onErrorEvent"
                )
            )
        }
    }

    override fun onPrintDataCancelledEvent(value: Boolean) {
        Log.d("onPrintDataCancelledEvent", value.toString())
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to value,
                    "event" to "onPrintDataCancelledEvent"
                )
            )
        }
    }

    override fun onPrinterOperationEndEvent(value: Boolean) {
        Log.d("onPrinterOperationEndEvent", value.toString())
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to value,
                    "event" to "onPrinterOperationEndEvent"
                )
            )
        }
    }

    override fun onReturnPrinterResultEvent(value: PrinterStatus) {
        Log.d(
            "onReturnPrinterResultEvent",
            value.printerStatusResult.toString()
        )
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to value.printerStatusResult.toString(),
                    "event" to "onReturnPrinterResultEvent"
                )
            )
        }
    }

    override fun onStatusMessageEvent(value: String?) {
        Log.d("onStatusMessageEvent", value!!)
        when (value) {
            "Perform remote KMS update" -> {
                onKmsUpdateRequired()
            }

            "Factory initialized." -> {
                onFactoryInitialized()
            }

            else -> {
                handler.post {
                    eventSink?.success(
                        mapOf(
                            "value" to value,
                            "event" to "onStatusMessageEvent"
                        )
                    )
                }
            }
        }
    }

    override fun onTransactionCompletedEvent(transactionClientResponse: TransactionClientResponse) {
        val gson = Gson()

        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to gson.toJson(transactionClientResponse),
                    "event" to "onTransactionCompletedEvent"
                )
            )
        }
    }

    override fun onUserApplicationSelectionRequiredEvent(value: ArrayList<String?>?) {
        print("onUserApplicationSelectionRequiredEvent")
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to value,
                    "event" to "onUserApplicationSelectionRequiredEvent"
                )
            )
        }
    }

    override fun onUserBudgetSelectionRequiredEvent(value: Boolean) {
        val budgetTypes = ArrayList<String>()
        budgetTypes.add("Straight")
        budgetTypes.add("3 Months")
        budgetTypes.add("6 Months")
        budgetTypes.add("12 Months")
        budgetTypes.add("24 Months")

        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to budgetTypes,
                    "event" to "onUserBudgetSelectionRequiredEvent"
                )
            )
        }
    }

    override fun onUserSignatureRequiredEvent(value: Boolean) {
        Log.d("onUserSignatureRequiredEvent", value.toString())
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to value,
                    "event" to "onUserSignatureRequiredEvent"
                )
            )
        }
    }

    override fun onWaitingForCardEvent(value: Boolean) {
        Log.d("onWaitingForCardEvent", value.toString())
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to value,
                    "event" to "onWaitingForCardEvent"
                )
            )
        }
    }

    override fun createPurchase(amount: String, description: String, userVoidable: Boolean) {
        Log.d("createPurchase", "amount: $amount, description: $description")
        factorybb = factorybb.createPurchase(amount, "0.00", "", true)
        factory!!.startTransaction(factorybb)
    }

    override fun voidTransaction(retrievalReferenceNumberBuilder: String) {
        val item = repo!!.getByReferenceData(retrievalReferenceNumberBuilder);
        factorybb = factorybb.createVoid("", item!!)
        factory!!.startTransaction(factorybb)
    }

    override fun continueTransaction(pos: Int, value: String) {
        handler.post {
            factory!!.continueTransactionApplication(
                pos,
                value
            )
        }
    }

    override fun continueTransactionBudget(value: Int) {
        factory!!.continueTransactionBudget(
            value
        )
    }

    override fun createCashback(amount: String, cashbackAmount: String, userVoidable: Boolean) {
        Log.d("createCashback", "amount: $amount, cashbackAmount: $cashbackAmount")
        factorybb = factorybb.createCashBack(amount, cashbackAmount, "", true)
        factory!!.startTransaction(
            factorybb
        )
    }

    override fun createCashWithdrawal(cashbackAmount: String, userVoidable: Boolean) {
        Log.d("createCashWithdrawal", "cashbackAmount: $cashbackAmount")
        factorybb = factorybb.createCashWithDrawable(cashbackAmount, "", true)
        factory!!.startTransaction(
            factorybb
        )
    }

    override fun getHistoryData(limit: Int, responseCode: String): List<String> {
        val gson = Gson()
        val items = repo!!.getHistoryData(
            responseCode = responseCode,
            limit = limit
        ).map {
            gson.toJson(it, TransactionItem::class.java)
        }
        return items;
    }

    override fun getByReferenceData(responseId: String): TransactionItem? {
        return repo!!.getByReferenceData(responseId);
    }

    override fun getDeviceInfo(context: Context, result: MethodChannel.Result) {
        val gson = Gson()
        factory = MockTransactionFactory(context)
        val serial = "P30224BCJ0696"
        val apiVersion = factory!!.getApiVersion()
        val hasOnboardPrinter = factory!!.hasOnboardPrinter()
        val build = gson.toJson(factory!!.getBuildAndSENumber())
        val manufacturer: String = Build.MANUFACTURER
        val model: String = Build.MODEL
        result.success(
            mapOf(
                "serial" to serial,
                "info" to apiVersion,
                "build" to build,
                "hasOnboardPrinter" to hasOnboardPrinter,
                "manufacturer" to manufacturer,
                "model" to model
            )
        )
    }

    override fun printReceipt(data: PrintRequest) {
        data.imageXpos = 0
        data.fontName = "arial" //monospace_typewriter.ttf
        data.bitmapImageResourceId = R.drawable.receipt
        data.customerTrailer = "TESDFSDFSD";
        factory!!.sendPrinterData(data)
    }

    override fun abortTransaction() {
        val response = TransactionClientResponse()
        response.responseCode = "91"
        response.declinedReason = "Transaction Aborted"
        response.responseMessage = "Transaction Cancelled"
        response.message = "Transaction Aborted"
        response.isCancelled = true
        response.isSuccessful = false
        response.isSupervisor = false
        response.transactionAmount = 0
        response.transactionClientAction = TransactionClientActionEnum.TRANSACTION_DECLINED
        onTransactionCompletedEvent(response)
    }

    override fun connect() {
        factory!!.connect()
    }

    override fun loadKeys() {
        val (message, status) = if ((0..1).random() == 0)
            "Keys loaded successfully" to "0"
        else
            "Failed to load keys" to "-1"
        onKmsUpdateResult(status, message)
    }

    override fun onKmsUpdateRequired() {
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to true,
                    "event" to "onKmsUpdateRequired"
                )
            )
        }
    }

    override fun onKmsUpdateResult(status: String, message: String) {
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to mapOf(
                        "status" to status,
                        "message" to message
                    ),
                    "event" to "onKmsUpdateResult"
                )
            )
        }
    }

    override fun onFactoryInitialized() {
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to true,
                    "event" to "onFactoryInitialized"
                )
            )
        }
    }

    override fun onOsUpdateRequired(build: String, seNumber: String) {
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to mapOf(
                        "build" to build,
                        "seNumber" to seNumber
                    ),
                    "event" to "onOsUpdateRequired"
                )
            )
        }
    }

    override fun performOsUpdate() {
        try {
            val intent = Intent()
            intent.setClassName(
                DeviceManagement.KMS_PACKAGENAME,
                DeviceManagement.CLASSNAME_OSUPDATE
            )
            intent.putExtra("IP_OTA", DeviceManagement.OTA_IP_ADDRESS)
            intent.putExtra("PORT_OTA", DeviceManagement.PORT)
            activity!!.startActivity(intent)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    override fun sendPrinterData(
        merchantReceipt: PrintRequest?,
        clientPrintRequest: PrintRequest?
    ) {
        TODO("Not yet implemented")
    }

    override fun cleanup() {
        factory!!.disconnect()
        factory!!.dispose()
    }

}
