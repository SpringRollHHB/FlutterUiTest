import 'package:flutter/material.dart';

class WillPopScopeWidget extends StatefulWidget {
  const WillPopScopeWidget({super.key});

  @override
  State<WillPopScopeWidget> createState() => _WillPopScopeWidgetState();
}

class _WillPopScopeWidgetState extends State<WillPopScopeWidget> {

  DateTime? lastTimeDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          // 物理返回按键或者右滑退出手势都会触发。
          if(lastTimeDate == null || DateTime.now().difference(lastTimeDate!) > const Duration(seconds: 1)) {
            lastTimeDate = DateTime.now();
            return false;
          }
          return true;
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text("点击返回",style: TextStyle(color: Colors.red,fontSize: 20),),
            ),
          ),
        ),
      ),
    );
  }
}
