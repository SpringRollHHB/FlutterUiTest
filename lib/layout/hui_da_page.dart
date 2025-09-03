import 'dart:async';
import 'dart:io';
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../channel/FlutterAndroidChannel.dart';

class HuiDaPage extends StatefulWidget {
  const HuiDaPage({super.key});

  @override
  State<HuiDaPage> createState() => _HuiDaPageState();
}

class _HuiDaPageState extends State<HuiDaPage> {

  Map<String, Object>? _locationResult;

  StreamSubscription<Map<String, Object>>? _locationListener;

  final AMapFlutterLocation _locationPlugin = AMapFlutterLocation();

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  void initLocation() {
    AMapFlutterLocation.updatePrivacyShow(true, true); //已经弹出隐式协议弹窗
    AMapFlutterLocation.updatePrivacyAgree(true); //隐式政策已经同意
    AMapFlutterLocation.setApiKey("b4c118369e6ef71261d305dc1389c91d","null");

    ///注册定位结果监听
    _locationListener = _locationPlugin.onLocationChanged().listen((Map<String, Object> result) {
      debugPrint("hhb locationPlugin -> $result");
      _locationResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top,),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed:  _startListenerLocation,
              child: Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "开始监听位置信息",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed:  _stopListenerLocation,
              child: Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "停止监听位置信息",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed:  () {
                FlutterToAndroid.sendSms();
              },
              child: Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "发送短信",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    ///移除定位监听
    if (null != _locationListener) {
      _locationListener?.cancel();
    }

    ///销毁定位
    _locationPlugin.destroy();
  }

  void _startListenerLocation() {
    _setLocationOption();
    _locationPlugin.startLocation();
  }

  void _stopListenerLocation() {
    _locationPlugin.stopLocation();
  }

  ///设置定位参数
  void _setLocationOption() {
    AMapLocationOption locationOption = AMapLocationOption();

    // 通用配置
    locationOption.onceLocation = false;
    locationOption.needAddress = true; //省，市，区，县信息
    locationOption.geoLanguage = GeoLanguage.DEFAULT;
    locationOption.locationInterval = 1000;
    locationOption.distanceFilter = -1; // Android: 持续定位; iOS: 不限制距离

    // Android 配置
    locationOption.locationMode = AMapLocationMode.Hight_Accuracy;
    locationOption.desiredAccuracy = DesiredAccuracy.Best;

    // iOS 专属配置
    if (Platform.isIOS) {
      locationOption.desiredLocationAccuracyAuthorizationMode =
          AMapLocationAccuracyAuthorizationMode.ReduceAccuracy;
      locationOption.pausesLocationUpdatesAutomatically = false;
    }

    _locationPlugin.setLocationOption(locationOption);
  }


}
