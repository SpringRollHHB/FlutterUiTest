package channel

import android.app.Activity
import android.app.AlertDialog
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.telephony.SmsManager
import androidx.fragment.app.FragmentActivity
import com.example.flutteruitest.AndroidToFlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class FlutterToAndroidPlugin : FlutterPlugin , ActivityAware {

    val SMS_SENT_ACTION = "SMS_SENT"
    val SMS_DELIVERED_ACTION = "SMS_DELIVERED"

    private val sentReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            println("sendSms(). sent Receiver resultCode:$resultCode")
            when (resultCode) {
                Activity.RESULT_OK -> {
                    // 短信成功发出
                    println("发送成功")
                }
                SmsManager.RESULT_ERROR_GENERIC_FAILURE -> println("sendSms(). 发送失败: 通用错误")
                SmsManager.RESULT_ERROR_RADIO_OFF -> println("sendSms(). 发送失败: 无信号")
                SmsManager.RESULT_ERROR_NULL_PDU -> println("sendSms(). 发送失败: PDU 错误")
                SmsManager.RESULT_ERROR_NO_SERVICE -> println("sendSms(). 发送失败: 无服务")
            }
        }
    }

    private val deliveredReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            println("sendSms(). delivered Receiver resultCode:$resultCode")
            when (resultCode) {
                Activity.RESULT_OK -> println("sendSms(). 对方已收到")
                Activity.RESULT_CANCELED -> println("sendSms(). 对方未收到")
            }
        }
    }

    private var channel : MethodChannel? = null
    private var ctx : Context? = null;
    private var activity: FragmentActivity? = null

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

            "sendSms" -> {
                try {
                    activity?.let {
                        val smsManager = SmsManager.getDefault()
                        val sentIntent = PendingIntent.getBroadcast(
                            it, 0, Intent(SMS_SENT_ACTION).setPackage(it.packageName), PendingIntent.FLAG_IMMUTABLE
                        )

                        val deliveredIntent = PendingIntent.getBroadcast(
                            it, 0, Intent(SMS_DELIVERED_ACTION).setPackage(it.packageName), PendingIntent.FLAG_IMMUTABLE
                        )
                        smsManager.sendTextMessage("1639081161", null, "无人车测试短信", sentIntent, deliveredIntent)
                        result.success("SMS success")
                    }
                } catch (e: Exception) {
                    result.error("FAILED", e.message, null)
                }
            }
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity as? FragmentActivity
        activity?.registerReceiver(sentReceiver, IntentFilter(SMS_SENT_ACTION))
        activity?.registerReceiver(deliveredReceiver, IntentFilter(SMS_DELIVERED_ACTION))
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = null
    }

    override fun onDetachedFromActivity() {
        activity = null
    }


}