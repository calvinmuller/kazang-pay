package net.kazang.pegasus

import android.util.Log
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.google.gson.JsonDeserializer
import com.prism.core.domain.BasePrintCommand
import com.prism.core.domain.DoubleTextPrintCommand
import com.prism.core.domain.NewLinePrintCommand
import com.prism.core.domain.PrintRequest
import com.prism.core.domain.SingleTextPrintCommand
import com.prism.core.enums.AlignmentEnum
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler


class PrinterHandler(private val transactionHandler: TransactionInterface) : MethodCallHandler {
    private val gsonBuilder = GsonBuilder()
    private var gson: Gson

    init {
        gsonBuilder.registerTypeAdapter(
            BasePrintCommand::class.java,
            JsonDeserializer<BasePrintCommand> { json, _, _ ->
                if (json.asJsonObject.has("leftAlignedValue")) {
                    val command = DoubleTextPrintCommand()
                    command.leftAlignedValue =
                        json.asJsonObject.get("leftAlignedValue")?.asString ?: ""
                    command.rightAlignedValue =
                        json.asJsonObject.get("rightAlignedValue")?.asString ?: ""
                    command.xPosition = json.asJsonObject.get("xPosition").asInt
                    command.bold = json.asJsonObject.get("bold").asBoolean
                    command.italic = json.asJsonObject.get("italic").asBoolean
                    command.yPosition = json.asJsonObject.get("yPosition").asInt
                    command.alignment =
                        AlignmentEnum.fromInt(json.asJsonObject.get("alignment").asInt)
                    command.fontSize = json.asJsonObject.get("fontSize").asInt
                    command
                } else if (json.asJsonObject.has("value")) {
                    val command = SingleTextPrintCommand()
                    command.value = json.asJsonObject.get("value")?.asString ?: ""
                    command.xPosition = json.asJsonObject.get("xPosition").asInt
                    command.bold = json.asJsonObject.get("bold").asBoolean
                    command.italic = json.asJsonObject.get("italic").asBoolean
                    command.yPosition = json.asJsonObject.get("yPosition").asInt
                    command.alignment =
                        AlignmentEnum.fromInt(json.asJsonObject.get("alignment").asInt)
                    command.fontSize = json.asJsonObject.get("fontSize").asInt
                    command
                } else {
                    val command = NewLinePrintCommand()
                    command
                }
            })
        gson = gsonBuilder.create()
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Log.d("PrinterHandler", "onMethodCall: ${call.method}")
        when (call.method) {
            "print" -> {
                val data = call.argument<HashMap<Any, Any>>("data")!!
                val printRequest = gson.fromJson(gson.toJson(data), PrintRequest::class.java)
                Log.d("PrinterHandler", "print: ${gson.toJson(data)}")
                result.success(gson.toJson(printRequest))
                transactionHandler.printReceipt(printRequest)
            }
            "sendPrinterData" -> {
                val merchantReceipt = call.argument<HashMap<Any, Any>>("merchantReceipt")!!
                val clientReceipt = call.argument<HashMap<Any, Any>>("clientReceipt")!!
                val merchantPrintRequest = gson.fromJson(
                    gson.toJson(merchantReceipt),
                    PrintRequest::class.java
                )
                val clientPrintRequest = gson.fromJson(
                    gson.toJson(clientReceipt),
                    PrintRequest::class.java
                )
                Log.d("PrinterHandler", "sendPrinterData: ${gson.toJson(merchantPrintRequest)}")
                transactionHandler.sendPrinterData(merchantPrintRequest, clientPrintRequest)
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}