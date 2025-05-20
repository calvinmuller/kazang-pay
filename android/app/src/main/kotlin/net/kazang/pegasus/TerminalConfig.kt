package net.kazang.pegasus

class TerminalConfig(
    var termapp_config: TermappConfigData,
    var terminal_config: TerminalConfigData,
    var merchant_config: MerchantConfigData
) {
    var user_config: UserConfigData? = null
}

class TerminalConfigData {
    var is_key_exchange_required: Boolean = false
    var contactless: Boolean = false
    var currency_symbol: String = ""
    var custom_parameters: CustomParametersData? = null
    var is_key_exchange_allowed: Boolean = false
    var currency_code: String = ""
    var last_sequence_number: String = ""
    var terminal_serial_number: String = ""
    var terminal_active: Boolean = false
    var terminal_id: String = ""
    var slip_header: String = ""
    var manual_pan_entry: Boolean = false
    var slip_trailer: String = ""
}

class CustomParametersData {
    var disabled_bins: List<Int> = emptyList()
    var cashbacks: CashbacksData? = null
    var refunds: RefundsData? = null
}

class CashbacksData {
    var allowed: Boolean = false
    var limit: String = "1000"
}

class RefundsData {
    var allowed: Boolean = false
    var limit: String = "1000"
}

class TermappConfigData {
    var secondary_ip: String = ""
    var primary_ip: String = ""
    var data_ksn: String = ""
    var secondary_port: Int = 0
    var primary_port: Int = 0
    var type: List<String> = emptyList()
    var pin_ksn: String = ""
}

class MerchantConfigData {
    var velocity_rules: List<Map<String, String>> = emptyList()
    var transaction_types: List<String> = emptyList()
    var card_set: List<String> = emptyList()
    var trading_name: String = ""
    var merchant_active: Boolean = false
    var routing_switch: String = ""
    var merchant_number: String = ""
}

class UserConfigData {
    var user_active: Boolean = false
    var device_log_request: Boolean = false
    var user: Long = 0
}