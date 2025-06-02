package net.kazang.tcp_receiver.tcp_receiver

/** TcpListenerPlugin */
import ServerPrefs.DEFAULT_PORT_NUMBER
import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class TcpReceiverPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "tcp_listener_plugin")
    channel.setMethodCallHandler(this)
    context = binding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
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

      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {

  }
}