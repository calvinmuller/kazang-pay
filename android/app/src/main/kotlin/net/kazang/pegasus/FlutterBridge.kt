package net.kazang.pegasus

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

object FlutterBridge {
    private const val CHANNEL = "net.kazang.pegasus/bridge"
    private var methodChannel: MethodChannel? = null

    fun initialize(flutterEngine: FlutterEngine) {
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
    }

    fun sendMessageToFlutter(event: String, message: Any?) {
        methodChannel?.invokeMethod(event, message)
    }
}