package com.sekiro.flutter_base

import android.os.RemoteException
import com.android.installreferrer.api.InstallReferrerClient
import com.android.installreferrer.api.InstallReferrerClient.InstallReferrerResponse
import com.android.installreferrer.api.InstallReferrerStateListener
import com.android.installreferrer.api.ReferrerDetails
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.Executor
import java.util.concurrent.Executors

class MainActivity : FlutterActivity(), MethodChannel.MethodCallHandler {
    private val backgroundExecutor: Executor = Executors.newSingleThreadExecutor()
    private lateinit var channel: MethodChannel

    private val prefKey = "checkedInstallReferrer"

    private fun checkInstallReferrer(result: MethodChannel.Result) {
        if (getPreferences(MODE_PRIVATE).getBoolean(prefKey, false)) {
            return
        }
        val referrerClient = InstallReferrerClient.newBuilder(this).build()
        backgroundExecutor.execute { getInstallReferrerFromClient(referrerClient, result) }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.sekiro.flutter_base.method_channel"
        )
        channel.setMethodCallHandler(this)
    }

    private fun getInstallReferrerFromClient(
        referrerClient: InstallReferrerClient,
        result: MethodChannel.Result
    ) {
        referrerClient.startConnection(object : InstallReferrerStateListener {
            override fun onInstallReferrerSetupFinished(responseCode: Int) {
                when (responseCode) {
                    InstallReferrerResponse.OK -> {
                        val response: ReferrerDetails? = try {
                            referrerClient.installReferrer
                        } catch (e: RemoteException) {
                            e.printStackTrace()
                            return
                        }
                        result.success(response?.installReferrer)

                        // Only check this once.
                        getPreferences(MODE_PRIVATE).edit().putBoolean(prefKey, true).apply()

                        // End the connection
                        referrerClient.endConnection()
                    }

                    InstallReferrerResponse.FEATURE_NOT_SUPPORTED -> {
                        result.success("FEATURE_NOT_SUPPORTED")
                    }
                    InstallReferrerResponse.SERVICE_UNAVAILABLE -> {
                        result.success("SERVICE_UNAVAILABLE")
                    }
                }
            }

            override fun onInstallReferrerServiceDisconnected() {
                result.success("onInstallReferrerServiceDisconnected")
            }
        })
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "getInstallReferrer") {
            checkInstallReferrer(result)
        } else {
            result.notImplemented()
        }
    }

}
