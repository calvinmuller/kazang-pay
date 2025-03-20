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
import com.prism.factory.BuildConfig
import com.prism.factory.datarepos.TransactionRepository
import com.prism.factory.factory.MockTransactionFactory

class MockTransactionHandler : TransactionHandler() {

    private var factory: MockTransactionFactory? = null
    private var factoryconstructor: FactoryConstructorData? = null
    private var repo: TransactionRepository? = null

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
            config.terminal_config.custom_parameters?.cashbacks?.limit?.toInt() ?: 1000
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

}
