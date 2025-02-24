import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../channel/FlutterAndroidChannel.dart';

class ChannelTestPage extends StatefulWidget {
  static const name = "/ChannelTestPage";
  const ChannelTestPage({super.key});

  @override
  State<ChannelTestPage> createState() => _ChannelTestPageState();
}

class _ChannelTestPageState extends State<ChannelTestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20,),
            GestureDetector(
              onTap: () {
                FlutterToAndroid.install();
              },
              child: Container(
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)
                ),
                alignment: Alignment.center,
                child: const Text(
                  "flutter to android test",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                FlutterToAndroid.openTestActivity();
              },
              child: Container(
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)
                ),
                alignment: Alignment.center,
                child: const Text(
                  "打开Android原生页面",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
