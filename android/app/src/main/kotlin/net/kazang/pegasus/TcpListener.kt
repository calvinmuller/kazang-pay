import android.util.Log
import java.io.*
import java.net.ServerSocket
import java.net.Socket
import kotlin.concurrent.thread

class TcpServer() {
    private val DEFAULT_PORT_NUMBER: Int = 8551
    private var serverSocket: ServerSocket? = null
    private var clientSocket: Socket? = null
    private var out: PrintWriter? = null
    private var `in`: BufferedReader? = null

    fun start() {
        thread {
            try {
                serverSocket = ServerSocket(DEFAULT_PORT_NUMBER)
                println("TCP Server started on port $DEFAULT_PORT_NUMBER")

                while (true) {
                    clientSocket = serverSocket!!.accept()
                    clientSocket!!.setSoLinger(false, 0)

                    out = PrintWriter(OutputStreamWriter(clientSocket!!.getOutputStream()), true)
                    `in` = BufferedReader(InputStreamReader(clientSocket!!.getInputStream()))

                    println("Client connected: ${clientSocket!!.inetAddress.hostAddress}")
                    handleClient()
                }
            } catch (e: IOException) {
                e.printStackTrace()
            }
        }
    }

    private fun handleClient() {
        val buffer = CharArray(1024)
        val requestBuilder = StringBuilder()
        var charsRead: Int

        try {
            while (`in`!!.read(buffer).also { charsRead = it } != -1) {
                val readChunk = String(buffer, 0, charsRead)
                requestBuilder.append(readChunk.replace("null", ""))
                if (requestBuilder.contains("SS|")) break

                Log.i("TcpListener", "Message partial: $readChunk")
            }

            if (requestBuilder.toString().contains("PING")) {
                respond("TRUE|SS|")
                return
            }

            // Pass to your event handler
            onClientMessage(requestBuilder)

        } catch (ex: IOException) {
            ex.printStackTrace()
            val errMsg = ex.message?.takeIf { it.isNotEmpty() } ?: "TcpListenerModule start error"
            Log.i("TcpListener", "On start: $errMsg")
        } finally {
            cleanup()
        }
    }

    private fun respond(message: String) {
        out?.println(message)
        println("Sent: $message")
    }

    private fun cleanup() {
        try {
            `in`?.close()
            out?.close()
            clientSocket?.close()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    private fun onClientMessage(message: StringBuilder) {
        println("Message event: ${message.toString()}")
        // Replace this with your logic
    }
}