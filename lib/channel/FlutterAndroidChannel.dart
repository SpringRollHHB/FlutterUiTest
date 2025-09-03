import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../layout/get_x_count_page.dart';

class FlutterToAndroid {
  static const MethodChannel _channel = MethodChannel("flutter.ui.test.flutter.to.android");

  static void init() {
    _channel.setMethodCallHandler(_callHandler);
  }

  static Future<void> sendSms() async {
    try {
      final result = await _channel.invokeMethod('sendSms');
      debugPrint("sendSms().. success : $result");
    } on PlatformException catch (e) {
      debugPrint("sendSms().. error: ${e.code}, ${e.message}");
    }
  }

  static Future<bool> install() async {
    bool result = await _channel.invokeMethod("install","com.text.app.name");
    return result;
  }

  static Future<bool> openTestActivity() async {
    bool result = await _channel.invokeMethod("openTestActivity");
    return result;
  }

  static Future<dynamic> _callHandler(MethodCall call) async {
    debugPrint("AndroidToFlutterChannel ....${call.method}...");
    switch(call.method) {
      case "install" : {

      }
      case "toNameContext" : {
        Get.toNamed(GetXCountPage.name);
      }
    }
  }

}