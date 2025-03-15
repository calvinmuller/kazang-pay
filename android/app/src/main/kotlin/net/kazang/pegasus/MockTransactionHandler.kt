package net.kazang.pegasus

import android.content.Context
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
import com.prism.factory.BuildConfig
import com.prism.factory.datarepos.TransactionRepository
import com.prism.factory.factory.MockTransactionFactory
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel


class MockTransactionHandler : FactoryActivityEvents, TransactionInterface {

    private var factory: MockTransactionFactory? = null
    private var factoryconstructor: FactoryConstructorData? = null
    private var connected = false
    private var factorybb = FactoryTransactionBuilder()

    private var handler = Handler(Looper.getMainLooper())
    private var eventSink: EventChannel.EventSink? = null
    var repo: TransactionRepository? = null

    override fun initialize(context: Context, config: TerminalConfig) {
        if (factory != null) {
            factory!!.disconnect();
            factory!!.dispose()
        }
        factoryconstructor = FactoryConstructorData()
        factoryconstructor!!.context = context
        factoryconstructor!!.p2peEnabled = true
        factoryconstructor!!.debugMode = BuildConfig.DEBUG
        factoryconstructor!!.serviceConfiguration =
            if (BuildConfig.DEBUG) ServiceConfigurationEnum.UAT else ServiceConfigurationEnum.PROD
        factoryconstructor!!.serviceTimeout = 60000
        factoryconstructor!!.proxyUrl = null
        factoryconstructor!!.proxyUserName = null
        factoryconstructor!!.proxyPassword = null
        factoryconstructor!!.useSSLCerticates = false
        val terminalSetup = TerminalSetup()
        terminalSetup.terminalId = config.terminal_config.terminal_id
        terminalSetup.merchantId = config.merchant_config.merchant_number
        factoryconstructor!!.terminalSetup = terminalSetup
        factoryconstructor!!.useExternalConfiguration = true
        factoryconstructor!!.posFactorySetup = PosFactorySetup()
        factoryconstructor!!.posFactorySetup!!.currencyCode =
            CurrencyTypeEnum.fromCountryCodeString(config.terminal_config.currency_code)
        factoryconstructor!!.posFactorySetup!!.routingSwitch =
            RoutingSwitchEnum.valueOf(config.merchant_config.routing_switch)
        factoryconstructor!!.posFactorySetup!!.velocityCount = 0
        factoryconstructor!!.posFactorySetup!!.velocityPeriod = 0
        factoryconstructor!!.posFactorySetup!!.cashbackLimit =
            config.terminal_config.custom_parameters?.cashbacks?.limit ?: 1000
        factoryconstructor!!.posFactorySetup!!.automaticSettlementTime = "13:23"
        factoryconstructor!!.posFactorySetup!!.enableSettlements = true
        factoryconstructor!!.posFactorySetup!!.parameterDownloadTime = "13:23"
        factoryconstructor!!.posFactorySetup!!.primaryTermappIpAddress =
            config.termapp_config.primary_ip
        factoryconstructor!!.posFactorySetup!!.primaryTermappPort =
            config.termapp_config.primary_port
        factoryconstructor!!.posFactorySetup!!.secondaryTermappIpAddress =
            config.termapp_config.secondary_ip
        factoryconstructor!!.posFactorySetup!!.secondaryTermappPort =
            config.termapp_config.secondary_port
        factoryconstructor!!.posFactorySetup!!.pinKSN = config.termapp_config.pin_ksn
        factoryconstructor!!.posFactorySetup!!.dataKSN = config.termapp_config.data_ksn
        factoryconstructor!!.posFactorySetup!!.batchNo = "001"

        val enabledTransactions = ArrayList<TransactionTypesEnum>()
        if (config.terminal_config.custom_parameters?.cashbacks?.allowed!!) {
            enabledTransactions.add(TransactionTypesEnum.CASH_BACK)
        }
        if (config.terminal_config.custom_parameters?.refunds?.allowed!!) {
            enabledTransactions.add(TransactionTypesEnum.REFUND)
        }
        config.merchant_config.transaction_types.forEach {
            val type = it.uppercase()
            if (type == "VOID") {
                enabledTransactions.add(TransactionTypesEnum.VOID_TRANSACTION)
            } else if (type == "CASH_WITHDRAWAL") {
                enabledTransactions.add(TransactionTypesEnum.CASH_WITH_DRAWAL)
            } else if (type == "PURCHASE_WITH_CASHBACK") {
                enabledTransactions.add(TransactionTypesEnum.PURCHASE_TIP)
            } else {
                enabledTransactions.add(TransactionTypesEnum.valueOf(type))
            }
        }
        factoryconstructor!!.posFactorySetup!!.enabledTransactions = enabledTransactions
        factory = MockTransactionFactory(factoryconstructor!!, this)
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
        Log.d("TransactionHandler - onBatteryStatusLowEvent", percentage.toString())
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
        Log.d("TransactionHandler - onDeviceInformationEvent", deviceInformation.toString())
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
        Log.d("TransactionHandler - onDisConnectEvent", value.toString())
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
        Log.d("TransactionHandler - onErrorEvent", value!!)
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
        Log.d("TransactionHandler - onPrintDataCancelledEvent", value.toString())
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
        Log.d("TransactionHandler - onPrinterOperationEndEvent", value.toString())
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
            "TransactionHandler - onReturnPrinterResultEvent",
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
        Log.d("TransactionHandler - onStatusMessageEvent", value!!)
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to value,
                    "event" to "onStatusMessageEvent"
                )
            )
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
        Log.d("TransactionHandler - onUserSignatureRequiredEvent", value.toString())
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
        Log.d("TransactionHandler - onWaitingForCardEvent", value.toString())
        handler.post {
            eventSink?.success(
                mapOf(
                    "value" to value,
                    "event" to "onWaitingForCardEvent"
                )
            )
        }
    }

    override fun createPurchase(amount: String, description: String) {
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

    override fun createCashback(amount: String, cashbackAmount: String) {
        Log.d("createCashback", "amount: $amount, cashbackAmount: $cashbackAmount")
        factorybb = factorybb.createCashBack(amount, cashbackAmount, "", true)
        factory!!.startTransaction(
            factorybb
        )
    }

    override fun createCashWithdrawal(cashbackAmount: String) {
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
        val serial = factory!!.getDeviceSerial()
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
        factory!!.sendPrinterData(data)
    }

    override fun abortTransaction() {
        val response = TransactionClientResponse()
        response.responseCode = "91"
        response.declinedReason = "Transaction Aborted"
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

}
