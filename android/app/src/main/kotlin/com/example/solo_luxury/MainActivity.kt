package com.example.solo_luxury

import android.content.Intent
import android.os.Bundle
import android.util.Log
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.*

class MainActivity : FlutterActivity() {
    private val CHANNEL = "flutter.native/helper"

    companion object {
        @JvmStatic
        var result: MethodChannel.Result? = null
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(Objects.requireNonNull(flutterEngine)!!)
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, r ->
                    if (call.method == "helloFromNativeCode") {
                        result = r
                        Log.e("TAG", "Result -> ${call.arguments}")
                        val intent = Intent(applicationContext, CardActivity::class.java)
                        intent.putExtra("result", Gson().toJson(call.arguments))
                        startActivity(intent)
                    }
                }
    }
}
