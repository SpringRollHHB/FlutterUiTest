package channel

import android.app.AlertDialog
import android.content.Context
import android.content.Intent
import com.example.flutteruitest.AndroidToFlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class FlutterToAndroidPlugin : FlutterPlugin {

    private var channel : MethodChannel? = null
    private var ctx : Context? = null;

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger,"flutter.ui.test.flutter.to.android")
        channel?.setMethodCallHandler(this::onMethodCall)
        AndroidToFlutter.setChannel(channel)
        ctx = binding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        TODO("Not yet implemented")
    }


    fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when(call.method) {
            "install" -> {
                println("FlutterToAndroidPlugin android端 收到函数 install...")
                result.success(true)
            }

            "openTestActivity" -> {
                println("FlutterToAndroidPlugin android端 收到函数 openTestActivity...")
                ctx?.let {
                    it.startActivity(Intent(it, AndroidToFlutterActivity::class.java))
                }
                result.success(true)
            }
        }
    }



}