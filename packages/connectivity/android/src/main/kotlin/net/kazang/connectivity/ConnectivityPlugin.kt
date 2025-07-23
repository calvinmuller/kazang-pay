package net.kazang.connectivity

import android.annotation.TargetApi
import android.content.*
import android.net.*
import android.os.Build
import android.os.Build.*
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** ConnectivityPlugin */
class ConnectivityPlugin :
    FlutterPlugin,
    EventChannel.StreamHandler {
    private lateinit var context: Context
    private var events: EventChannel.EventSink? = null
    private var connectivityManager: ConnectivityManager? = null
    private var networkCallback: ConnectivityManager.NetworkCallback? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val channel = EventChannel(binding.binaryMessenger, "connectivity/status")
        channel.setStreamHandler(this)
    }

    private val mainHandler = Handler(Looper.getMainLooper())

    @TargetApi(VERSION_CODES.N)
    override fun onListen(arguments: Any?, eventSink: EventChannel.EventSink?) {
        events = eventSink
        networkCallback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                mainHandler.post {
                    events?.success(true)
                }
            }

            override fun onLost(network: Network) {
                mainHandler.post {
                    events?.success(false)
                }
            }

            override fun onCapabilitiesChanged(network: Network, capabilities: NetworkCapabilities) {
                val hasInternet = capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                mainHandler.post {
                    events?.success(hasInternet)
                }
            }
        }

        connectivityManager?.registerDefaultNetworkCallback(networkCallback!!)
    }

    override fun onCancel(arguments: Any?) {
        networkCallback?.let {
            connectivityManager?.unregisterNetworkCallback(it)
        }
        networkCallback = null
        events = null
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }
}
