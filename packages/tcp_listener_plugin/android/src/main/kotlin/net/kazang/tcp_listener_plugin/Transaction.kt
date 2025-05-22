import org.json.JSONObject

data class Transaction(
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

            val typeCode = when (parts[2]) {
                "1" -> "Purchase"
                "2" -> "Purchase with Cashback"
                "3" -> "Cash Withdrawal"
                "4" -> "Cancel (Void)"
                "5" -> "Refund (Unsupported)"
                else -> "Unknown"
            }

            return Transaction(
                amount = parts[0],
                cashbackAmount = parts[1],
                type = typeCode,
                uniqueId = parts[3],
                port = parts[4],
                timeout = parts[5],
                refNo = parts[6]
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