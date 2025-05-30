package net.kazang.tcp_receiver.tcp_receiver
import org.json.JSONObject


data class Transaction(
    val accountNumber: String,
    val cardNumber: String,
    val amount: String,
    val cashbackAmount: String,
    val type: String,
    val uniqueId: String,
    val port: String,
    val timeout: String,
    val refNo: String
) {
    companion object {
        fun fromDelimitedString(message: String): Transaction? {
            val parts = message.split("|")
            if (parts.size < 7) return null

            val typeCode = when (parts[4]) {
                "1" -> "Purchase"
                "2" -> "Purchase with Cashback"
                "3" -> "Cash Withdrawal"
                "4" -> "Cancel"
                "5" -> "Refund (Unsupported)"
                else -> "Unknown"
            }

            return Transaction(
                accountNumber = parts[0],
                cardNumber = parts[1],
                amount = parts[2],
                cashbackAmount = parts[3],
                type = typeCode,
                uniqueId = parts[5],
                port = parts[6],
                timeout = parts[7],
                refNo = parts[8]
            )
        }

        fun fromJson(json: HashMap<Any, Any>): Transaction {
            return Transaction(
                amount = json["amount"].toString(),
                cashbackAmount = json["cashbackAmount"].toString(),
                type = json["type"].toString(),
                uniqueId = json["uniqueId"].toString(),
                port = json["port"].toString(),
                timeout = json["timeout"].toString(),
                refNo = json["refNo"].toString(),
                cardNumber = json["cardNumber"].toString(),
                accountNumber = json["accountNumber"].toString(),
            )
        }
    }

    fun toDelimitedString(): String {
        val typeCode = when (type) {
            "Purchase" -> "1"
            "Purchase with Cashback" -> "2"
            "Cash Withdrawal" -> "3"
            "Cancel (Void)" -> "4"
            "Refund (Unsupported)" -> "5"
            else -> "0"
        }

        return listOf(
            accountNumber,
            cardNumber,
            amount,
            cashbackAmount,
            typeCode,
            uniqueId,
            port,
            timeout,
            refNo,
            "SS"
        ).joinToString("|") + "|"
    }

    fun toJson(): String {
        val obj = JSONObject()
        obj.put("accountNumber", accountNumber)
        obj.put("cardNumber", cardNumber)
        obj.put("amount", amount)
        obj.put("cashbackAmount", cashbackAmount)
        obj.put("type", type)
        obj.put("uniqueId", uniqueId)
        obj.put("port", port)
        obj.put("timeout", timeout)
        obj.put("refNo", refNo)
        return obj.toString()
    }

}