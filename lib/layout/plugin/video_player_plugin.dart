import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class VideoPlayerPlugin {
  static const _methodChannel = MethodChannel('flutter.plugins.video.player');

  // 调用平台通道方法来跳转到 iOS 原生页面
  static Future<void> navigateToNativePage() async {
    try {
      await _methodChannel.invokeMethod('videoPlayerNet');
    } on PlatformException catch (e) {
      debugPrint("hhb Failed to navigate to native page: '${e.message}'.");
    }
  }

}