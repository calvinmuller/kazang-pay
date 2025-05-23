package net.kazang.tcp_listener_plugin

import android.content.Context

object ServerPrefs {
    private const val PREFS_NAME = "tcp_server_prefs"
    private const val KEY_PORT = "tcp_port"
    private const val KEY_ENABLED = "tcp_enabled"
    const val DEFAULT_PORT_NUMBER = 8551

    fun savePrefs(context: Context, port: Int, enabled: Boolean) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        prefs.edit()
            .putInt(KEY_PORT, port)
            .putBoolean(KEY_ENABLED, enabled)
            .apply()
    }

    fun getPort(context: Context): Int {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE).getInt(KEY_PORT, DEFAULT_PORT_NUMBER)
    }

    fun isEnabled(context: Context): Boolean {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE).getBoolean(KEY_ENABLED, true)
    }
}