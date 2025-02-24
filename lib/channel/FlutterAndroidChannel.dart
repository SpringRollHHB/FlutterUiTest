import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FlutterToAndroid {
  static const MethodChannel _channel = MethodChannel("flutter.ui.test.flutter.to.android");

  static void init() {
    _channel.setMethodCallHandler(_callHandler);
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
    switch(call.method) {
      case "install" : {
        debugPrint("AndroidToFlutterChannel install ...");
      }
    }
  }

}