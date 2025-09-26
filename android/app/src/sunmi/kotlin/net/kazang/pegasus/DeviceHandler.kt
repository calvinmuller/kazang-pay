package net.kazang.pegasus

import android.content.Context
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class DeviceHandler(private val context: Context) : MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setKeyboardToNumeric" -> {
                try {
                    // DeviceManager is not available on Sunmi devices
                    Log.d("DeviceHandler", "setKeyboardToNumeric: DeviceManager not available on Sunmi")

                    // Return success as this functionality is not needed on Sunmi
                    Log.d("DeviceHandler", "Keyboard setting not required for Sunmi device")
                    result.success(true)
                } catch (e: Exception) {
                    Log.e("DeviceHandler", "Error in keyboard setting", e)
                    result.error("DEVICE_ERROR", "Error in keyboard setting", e.message)
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}