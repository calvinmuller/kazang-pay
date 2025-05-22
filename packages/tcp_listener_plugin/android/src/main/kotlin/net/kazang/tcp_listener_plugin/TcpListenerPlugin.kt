package net.kazang.tcp_listener_plugin

/** TcpListenerPlugin */
import Transaction
import android.content.Context
import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.net.ServerSocket
import java.net.Socket
import android.util.Log
import net.kazang.tcp_listener_plugin.ServerPrefs.DEFAULT_PORT_NUMBER
import java.util.HashMap

class TcpListenerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private var isRunning = false
    private var serverThread: Thread? = null
    private lateinit var context: Context
    private var output: java.io.OutputStream? = null

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "tcp_listener_plugin")
        channel.setMethodCallHandler(this)
        context = binding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startServer" -> {
                startServer()
                result.success("ok")
            }

            "stopServer" -> {
                isRunning = false
                result.success("ok")
            }

            "setServerConfig" -> {
                val port = call.argument<Int>("port") ?: DEFAULT_PORT_NUMBER
                val enabled = call.argument<Boolean>("enabled") ?: true
                ServerPrefs.savePrefs(context, port, enabled)
                result.success("ok")
            }

            "getServerConfig" -> {
                val port = ServerPrefs.getPort(context)
                val enabled = ServerPrefs.isEnabled(context)
                result.success(mapOf("port" to port, "enabled" to enabled))
            }

            "transactionCompleted" -> {
                val transaction = call.argument<HashMap<Any, Any>>("transaction")
                if (transaction != null) {
                    val transactionObj = Transaction.fromJson(transaction)
                    val response = transactionObj.toDelimitedString()
                    output?.write(response.toByteArray())
                    output?.flush()
                    result.success("Transaction completed")
                } else {
                    result.error("INVALID_ARGUMENT", "Transaction argument is required", null)
                }
            }

            else -> result.notImplemented()
        }
    }

    private fun startServer() {
        if (!ServerPrefs.isEnabled(context)) return
        if (isRunning) return

        isRunning = true
        serverThread = Thread {
            try {
                val serverSocket = ServerSocket(ServerPrefs.getPort(context))
                while (isRunning) {
                    val client: Socket = serverSocket.accept()
                    Thread {
                        handleClient(client)
                    }.start()
                }
                serverSocket.close()
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
        serverThread?.start()
    }

    private fun handleClient(socket: Socket) {
        socket.use {
            val input = it.getInputStream()
            val output = it.getOutputStream()
            val buffer = ByteArray(1024)
            val messageBuilder = StringBuilder()

            var bytesRead: Int
            while (true) {
                bytesRead = input.read(buffer)
                if (bytesRead == -1) break
                val chunk = String(buffer, 0, bytesRead)
                messageBuilder.append(chunk)
                if (messageBuilder.contains("SS|")) break
            }

            val rawMessage = messageBuilder.toString().replace("SS|", "").trim()

            if (rawMessage.contains("PING")) {
                output.write("TRUE|SS|\n".toByteArray())
                output.flush()
                return
            }

            val transaction = Transaction.fromDelimitedString(rawMessage)
            if (transaction == null) {
                output.write("ERROR: Invalid transaction format\n".toByteArray())
                output.flush()
                return
            }

            Log.i("TCP", "Received Transaction: $transaction")

            // Respond to client
            output.write("RECEIVED: ${transaction.type}\n".toByteArray())
            output.flush()

            // Notify Flutter
            notifyFlutter(transaction, output)
        }
    }

    private fun notifyFlutter(transaction: Transaction, output: java.io.OutputStream? = null) {
        this.output = output
        Handler(Looper.getMainLooper()).post {
            channel.invokeMethod("onTransactionReceived", transaction.toJson())
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        isRunning = false
    }
}