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
import com.prism.core.enums.TransactionTypesEnum
import com.prism.core.helpers.FactoryTransactionBuilder
import com.prism.core.interfaces.FactoryActivityEvents
import com.prism.core.static.PrismCodes
import com.prism.device.management.DeviceManagement
import com.prism.factory.BuildConfig as FactoryBuildConfig
import com.prism.factory.datarepos.TransactionRepository
import com.prism.factory.factory.TransactionFactory
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import net.kazang.pegasus.BuildConfig
import java.util.HashMap
import kotlin.concurrent.thread

interface TransactionInterface : EventChannel.StreamHandler, FactoryActivityEvents {

    fun initialize(context: Context, config: TerminalConfig, proxy: Boolean = false)
    fun createPurchase(amount: String, description: String)
    fun voidTransaction(retrievalReferenceNumberBuilder: String)
    fun continueTransaction(pos: Int, value: String)
    fun continueTransactionBudget(value: Int)
    fun createCashback(amount: String, cashbackAmount: String)
    fun createCashWithdrawal(cashbackAmount: String)
    fun getHistoryData(limit: Int = 0, responseCode: String = ""): List<String>
    fun getByReferenceData(responseId: String): TransactionItem?
    fun getDeviceInfo(context: Context, result: MethodChannel.Result)
    fun printReceipt(data: PrintRequest)
    fun abortTransaction()
    fun connect()
    fun loadKeys()
    fun onKmsUpdateRequired()
    fun onKmsUpdateResult(status: String, message: String)
    fun onFactoryInitialized()
    fun onOsUpdateRequired(build: String, seNumber: String)
    fun performOsUpdate()
    fun sendPrinterData(merchantReceipt: PrintRequest?, clientPrintRequest: PrintRequest?)
}

class TransactionHandler : TransactionInterface {

    private var factory: TransactionFactory? = null
    private var factoryConstructor: FactoryConstructorData? = null
    private var connected = false
    private var factorybb = FactoryTransactionBuilder()

    private var handler = Handler(Looper.getMainLooper())
    private var eventSink: EventChannel.EventSink? = null
    private var repo: TransactionRepository? = null
    private var transactionType: TransactionTypesEnum? = null
    private var activity: Activity? = null

    override fun initialize(context: Context, config: TerminalConfig, proxy: Boolean) {
        if (connected && factory != null) {
            factory!!.disconnect()
            factory!!.dispose()
            factory = null
        }
        activity = context as Activity
        if (factory == null) {
            factory = TransactionFactory(context)
        }
        val result = factory!!.getBuildAndSENumber()
        factory!!.dispose()

        if (result.requiredUpdate) {
            onOsUpdateRequired(result.buildNumber!!, result.seNumber!!)
        } else {
            setupFactory(context, config, proxy)
        }
    }

    private fun setupFactory(context: Activity, config: TerminalConfig, proxy: Boolean) {
        factoryConstructor = FactoryConstructorData()
        factoryConstructor!!.context = context
        factoryConstructor!!.p2peEnabled = true
        factoryConstructor!!.debugMode = FactoryBuildConfig.DEBUG
        factoryConstructor!!.serviceConfiguration = if (BuildConfig.FLAVOR == "prod") {
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
        factory = TransactionFactory(factoryConstructor!!, this)
        factory!!.initialize()
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

        Log.d("onTransactionCompletedEvent", gson.toJson(transactionClientResponse).toString())

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
        clientReceipt: PrintRequest?
    ) {
        merchantReceipt!!.fontName = "arial" //monospace_typewriter.ttf
        merchantReceipt.bitmapImageResourceId = R.drawable.receipt

        clientReceipt!!.fontName = "arial" //monospace_typewriter.ttf
        clientReceipt.bitmapImageResourceId = R.drawable.receipt

        factory!!.sendPrinterData(merchantReceipt!!, clientReceipt!!)
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

    override fun createPurchase(amount: String, description: String) {
        transactionType = null
        Log.d("createPurchase", "amount: $amount, description: $description")
        factorybb = factorybb.createPurchase(amount, "0.00", "", true)
        factory!!.startTransaction(factorybb)
    }

    override fun voidTransaction(rrn: String) {
        transactionType = TransactionTypesEnum.VOID_TRANSACTION
        val item = repo!!.getByReferenceData(rrn)
        factorybb = factorybb.createVoid("VOID", item!!)
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

    override fun createCashback(amount: String, cashbackAmount: String) {
        transactionType = null
        Log.d("createCashback", "amount: $amount, cashbackAmount: $cashbackAmount")
        factorybb = factorybb.createCashBack(amount, cashbackAmount, "", true)
        factory!!.startTransaction(
            factorybb
        )
    }

    override fun createCashWithdrawal(cashbackAmount: String) {
        transactionType = null
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
        val transactionItem = repo!!.getByReferenceData(responseId);
        transactionItem?.TransactionType = transactionType?.name ?: transactionItem?.TransactionType
        return transactionItem
    }

    override fun getDeviceInfo(context: Context, result: MethodChannel.Result) {
        val gson = Gson()
        factory = TransactionFactory(context)
        val packageManager = context.packageManager
        val serial = factory!!.getDeviceSerial()
        val apiVersion = factory!!.getApiVersion()
        val hasOnboardPrinter = factory!!.hasOnboardPrinter()
        val build = gson.toJson(factory!!.getBuildAndSENumber())
        val manufacturer: String = Build.MANUFACTURER
        val model: String = Build.MODEL
        val info = packageManager.getPackageInfo(context.packageName, 0)

        factory!!.dispose()
        factory = null
        result.success(
            mapOf(
                "serial" to serial,
                "info" to apiVersion,
                "build" to build,
                "hasOnboardPrinter" to hasOnboardPrinter,
                "manufacturer" to manufacturer,
                "model" to model,
                "version" to mapOf(
                    "name" to info.versionName,
                    "code" to info.versionCode
                )
            )
        )
    }

    override fun printReceipt(data: PrintRequest) {
        thread {
            data.fontName = "arial" //monospace_typewriter.ttf
            data.bitmapImageResourceId = R.drawable.receipt
            factory!!.sendPrinterData(data)
        }
    }

    override fun abortTransaction() {
        Log.d("abortTransaction", "abort")
        factory!!.abortTransaction()
    }

    override fun connect() {
        if (!connected)
            factory!!.connect()
    }

    override fun loadKeys() {
        try {
            val intent = Intent()
            intent.setClassName(
                DeviceManagement.KMS_PACKAGENAME,
                DeviceManagement.KMS_CLASSNAME
            )
            intent.putExtra("IP_RKI", DeviceManagement.KMS_IP_ADDRESS)
            intent.putExtra("PORT_RKI", DeviceManagement.RKI_PORT)
            intent.putExtra("PORT_CA_RKI", DeviceManagement.CA_RKI_PORT)
            intent.putExtra("customer", 2)
            activity!!.startActivityForResult(
                intent,
                PrismCodes.KEY_INJECTION_REQUEST_CODE
            )
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

}
