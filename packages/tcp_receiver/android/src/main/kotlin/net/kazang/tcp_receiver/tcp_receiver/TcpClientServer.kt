package net.kazang.tcp_receiver.tcp_receiver

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import java.io.BufferedReader
import java.io.IOException
import java.io.InputStreamReader
import java.io.OutputStreamWriter
import java.io.PrintWriter
import java.net.ServerSocket
import java.net.Socket
import kotlin.concurrent.thread

private const val TAG = "TcpListenerModule"
private const val EMPTY_REPLACEMENT = ""
private const val STOP_INDICATOR = "SS|"
private const val PING_REQUEST = "PING"
private const val PING_RESPONSE = "TRUE|SS|"

class TcpClientServer(channel: MethodChannel) {
    private var serverSocket: ServerSocket? = null
    private var clientSocket: Socket? = null
    private var out: PrintWriter? = null
    private var `in`: BufferedReader? = null
    private var channel: MethodChannel = channel

    /** Starts the server socket listening for a client connection */
    @Throws(IOException::class)
    fun start(context: Context) {
        try {
            initializeConnection(context)
        } catch (ex: Exception) {
            logErrorAndEmitEvent("start", ex)
        }
    }

    @Throws(IOException::class)
    private fun initializeConnection(context: Context) {
        if (!ServerPrefs.isEnabled(context)) {
            Log.i(TAG, "Server is disabled")
            return
        }
        if (isRunning()) {
            Log.i(TAG, "Server is already running")
            return
        }
        thread {
            serverSocket = ServerSocket(ServerPrefs.getPort(context))
            clientSocket = serverSocket!!.accept().apply {
                setSoLinger(false, 0)
            }
            out = PrintWriter(OutputStreamWriter(clientSocket!!.getOutputStream()), false)
            `in` = BufferedReader(InputStreamReader(clientSocket!!.getInputStream()))
            handleIncomingMessages(context)
        }
    }

    private fun handleIncomingMessages(context: Context) {
        try {
            val buffer = CharArray(1024)
            val requestData = StringBuilder()

            while (true) {
                val charsRead = `in`?.read(buffer) ?: break
                val chunk = String(buffer, 0, charsRead).replace("null", EMPTY_REPLACEMENT)
                requestData.append(chunk)
                Log.i(TAG, chunk)
                if (chunk.contains(STOP_INDICATOR)) break
            }

            val message = requestData.toString()
            Log.i(TAG, "Message request: $message")

            if (message.contains(PING_REQUEST) || message == "") {
                respond(PING_RESPONSE, context)
                return
            }

            val transaction = Transaction.fromDelimitedString(message)
                ?: throw IllegalArgumentException("Invalid message format")
            notifyFlutter(transaction = transaction)

        } catch (ex: Exception) {
            logErrorAndEmitEvent("handleIncomingMessages", ex)
        }
    }

    fun respond(value: String, context: Context) {
        try {
            out?.let {
                it.println(value)
                it.flush()
                if (it.checkError()) throw IOException("Client disconnected")
            } ?: throw IOException("Output stream not initialized")

            stop()
            Thread.sleep(3000)
            Thread { tryReStart(context) }.start()
        } catch (ex: Exception) {
            handleRespondError(ex, context)
        }
    }

    private fun tryReStart(context: Context) {
        try {
            initializeConnection(context)
        } catch (ex: IOException) {
            logErrorAndEmitEvent("tryReStart", ex)
        }
    }

    private fun handleRespondError(ex: Exception, context: Context) {
        logErrorAndEmitEvent("respond", ex)
        stop()
        Thread.sleep(3000)
        Thread { tryReStart(context) }.start()
    }

    fun stop() {
        try {
            `in`?.close(); out?.close(); clientSocket?.close(); serverSocket?.close()
            `in` = null; out = null; clientSocket = null; serverSocket = null
        } catch (ex: Exception) {
            logErrorAndEmitEvent("stop", ex)
        }
    }

    fun isRunning(): Boolean = `in` != null || out != null

    private fun logErrorAndEmitEvent(action: String, ex: Exception) {
        val errMsg = "TcpListenerModule ${ex.message}"
        Log.i(TAG, "On $action: $errMsg")
        ex.printStackTrace()
    }

    private fun notifyFlutter(transaction: Transaction) {
        Handler(Looper.getMainLooper()).post {
            channel.invokeMethod("onTransactionReceived", transaction.toJson())
        }
    }

    fun complete(transaction: String, context: Context) {
        thread {
            respond(transaction, context)
        }
    }
}