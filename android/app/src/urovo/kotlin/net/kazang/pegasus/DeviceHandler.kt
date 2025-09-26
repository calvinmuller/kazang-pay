package net.kazang.pegasus

import android.content.Context
import android.device.DeviceManager
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class DeviceHandler(private val context: Context) : MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setKeyboardToNumeric" -> {
                try {
                    val deviceManager = DeviceManager()

                    Log.d("DeviceHandler", "setKeyboardToNumeric: ${deviceManager.getSettingProperty("Global-ufans.keyboard.state")}")

                    val success = deviceManager.setSettingProperty("Global-ufans.keyboard.state", "0")

                    if (success) {
                        Log.d("DeviceHandler", "Successfully set keyboard to numeric mode")
                        result.success(true)
                    } else {
                        Log.w("DeviceHandler", "Failed to set keyboard to numeric mode")
                        result.error("SETTING_FAILED", "Failed to set keyboard state", null)
                    }
                } catch (e: Exception) {
                    Log.e("DeviceHandler", "Error setting keyboard state", e)
                    result.error("DEVICE_ERROR", "Error setting keyboard state", e.message)
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}