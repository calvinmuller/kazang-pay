package net.kazang.pegasus

import android.content.Context
import android.content.Intent
import android.media.MediaPlayer
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.provider.Settings
import android.util.Log
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.prism.core.static.PrismCodes
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.runBlocking
import java.lang.reflect.Type
import java.util.Locale
import kotlin.collections.HashMap
import kotlin.concurrent.thread

private val Context.sharedPreferencesDataStore: DataStore<Preferences> by preferencesDataStore("APP_STATE")

class MainActivity : FlutterActivity() {
    private val CHANNEL = "kazangpay"
    private val PRINT_CHANNEL = "kazangpay_print"
    private var mediaPlayer: MediaPlayer? = null
    private val eventChannel = "factoryEventHandler"
    private lateinit var transactionHandler: TransactionInterface
    private val gson = Gson()
    private var initialIntentMap: Map<String, Any?>? = mapOf()

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        Locale.setDefault(Locale.US)
        super.configureFlutterEngine(flutterEngine)

        if (android.os.Build.MODEL.contains("sdk_gphone64_arm64")) {
            transactionHandler = MockTransactionHandler()
        } else {
            transactionHandler = TransactionHandler()

            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                PRINT_CHANNEL
            ).setMethodCallHandler(
                PrinterHandler(
                    transactionHandler
                )
            )
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, eventChannel).setStreamHandler(
            transactionHandler
        )

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "connect") {
                val config = call.argument<HashMap<Any, Any>>("config")!!
                val proxy = call.argument<Boolean>("proxy")!!
                val json = gson.toJson(config)
                val terminalConfig = gson.fromJson(json, TerminalConfig::class.java)
                transactionHandler.initialize(context, terminalConfig, proxy)
                result.success(true)
            } else if (call.method == "createPurchase") {
                thread {
                    transactionHandler.createPurchase(
                        amount = call.argument<String>("amount")!!,
                        description = call.argument<String>("description")!!
                    )
                }
                result.success(true)
            } else if (call.method == "getDeviceInfo") {
                transactionHandler.getDeviceInfo(context, result)
            } else if (call.method == "continueTransaction") {
                thread {
                    transactionHandler.continueTransaction(
                        value = call.argument<String>("value")!!,
                        pos = call.argument<Int>("pos")!!
                    )
                }
                result.success(true)
            } else if (call.method == "createCashback") {
                transactionHandler.createCashback(
                    amount = call.argument<String>("amount")!!,
                    cashbackAmount = call.argument<String>("cashbackAmount")!!
                )
                result.success(true)
            } else if (call.method == "createCashWithdrawal") {
                transactionHandler.createCashWithdrawal(
                    cashbackAmount = call.argument<String>("cashbackAmount")!!
                )
                result.success(true)
            } else if (call.method == "voidTransaction") {
                val rrn = call.argument<String>("rrn")!!
                thread {
                    transactionHandler.voidTransaction(rrn)
                }
                result.success(true)
            } else if (call.method == "continueTransactionBudget") {
                thread {
                    transactionHandler.continueTransactionBudget(value = call.argument<Int>("value")!!)
                }
                result.success(true)
            } else if (call.method == "getHistoryData") {
                thread {
                    val transactions = transactionHandler.getHistoryData()
                    result.success(transactions)
                }
            } else if (call.method == "getByReferenceData") {
                val transaction = transactionHandler.getByReferenceData(call.argument<String>("responseId")!!)
                result.success(gson.toJson(transaction))
            } else if (call.method == "abortTransaction") {
                thread {
                    transactionHandler.abortTransaction()
                }
                result.success(true)
            } else if (call.method == "paymentSuccess") {
                mediaPlayer = MediaPlayer.create(this, R.raw.success)
                play()
                result.success(true)
            } else if (call.method == "save") {
                val key = call.argument<String>("key")!!
                val value = call.argument<HashMap<Any, Any>>("value")!!
                runBlocking {
                    dataStoreSetString(key, value)
                }
                result.success(true)
            } else if (call.method == "load") {
                try {
                    val key = call.argument<String>("key")!!
                    val value = getJson(key)
                    result.success(value)
                } catch (e: Exception) {
                    result.error("Error", e.message, e)
                }
            } else if (call.method == "reconnect") {
                transactionHandler.connect()
                result.success(true)
            } else if (call.method == "getIntentInfo") {
                result.success(initialIntentMap)
            } else if (call.method == "performRemoteKmsUpdate") {
                thread {
                    transactionHandler.loadKeys()
                }
            } else if (call.method == "performOsUpdate") {
                thread {
                    transactionHandler.performOsUpdate()
                }
            } else {
                result.notImplemented()
            }
        }
        requestForStoragePermissions()
    }

    private fun play() {
        mediaPlayer?.setOnPreparedListener(MediaPlayer.OnPreparedListener {
            mediaPlayer?.start()
        })
    }

    private suspend fun dataStoreSetString(key: String, value: HashMap<Any, Any>) {
        val stringKey = stringPreferencesKey(key)
        val string = gson.toJson(value)
        context.sharedPreferencesDataStore.edit { preferences -> preferences[stringKey] = string }
    }

    private fun getJson(key: String): HashMap<Any, Any> {
        val value: String?
        runBlocking {
            val preferencesKey = stringPreferencesKey(key)
            val result =
                context.sharedPreferencesDataStore.data.map { preferences -> preferences[preferencesKey] }
            value = result.firstOrNull()
        }
        val type: Type = object : TypeToken<HashMap<Any, Any>>() {}.type
        if (value != null) {
            return gson.fromJson(value, type)
        } else {
            return HashMap()
        }
    }

    private fun handleIntent(intent: Intent) {
        val username = intent.getStringExtra("User Number") ?: intent.getStringExtra("Username")
        val intentMap = mapOf<String, Any?>(
            "username" to username,
        )
        Log.d("onAttachedToActivity", intentMap.toString())
        initialIntentMap = intentMap
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        handleIntent(intent)
    }

    private fun requestForStoragePermissions() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            if (!Environment.isExternalStorageManager()) {
                try {
                    val intent = Intent()
                    intent.setAction(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION)
                    val uri = Uri.fromParts("package", this.packageName, null)
                    intent.setData(uri)
                    startActivityForResult(intent, 0)
                } catch (e: Exception) {
                    val intent = Intent()
                    intent.setAction(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION)
                    startActivityForResult(intent, 0)
                }
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == PrismCodes.KEY_INJECTION_REQUEST_CODE) {
            var message = "Error loading keys."
            var status = "-1"
            Log.d("onActivityResult", "onActivityResult: $requestCode $resultCode $data")
            try {
                if (data != null) {
                    if (data.hasExtra("message")) {
                        message = data.getStringExtra("message") + ""
                    }
                    if (data.hasExtra("status")) {
                        status = java.lang.String.valueOf(data.getIntExtra("status", -1))
                    }
                    transactionHandler.onKmsUpdateResult(status, message)
                }
            } catch (ex: Exception) {
                ex.printStackTrace()
                transactionHandler.onKmsUpdateResult(status, message)
            }
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && requestCode != PrismCodes.KEY_INJECTION_REQUEST_CODE) {
            //Android is 11 (R) or above
            if (Environment.isExternalStorageManager()) {
                //Manage External Storage Permissions Granted
                Log.d("Permission", "onActivityResult: Manage External Storage Permissions Granted");
            } else {
                Log.d("Permission", "onActivityResult: Storage Permissions Denied");
            }
        }
    }

}
