import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/tool/async_await_utils.dart';

class AsyncWaitPage extends StatefulWidget {
  static const name = "/AsyncWaitPage";
  const AsyncWaitPage({super.key});

  @override
  State<AsyncWaitPage> createState() => _AsyncWaitPageState();
}

class _AsyncWaitPageState extends State<AsyncWaitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 20,),
          GestureDetector(
            onTap: () {
              AsyncAwaitUtils.getBoolValueNoAsync().then((value) => debugPrint("AsyncAwaitUtils-getBoolValueNoAsync --- $value"));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              alignment: Alignment.center,
              height: 40,
              child: const Text(
                "Future-不带async",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              AsyncAwaitUtils.getBoolValueWithAsync().then((value) => debugPrint("AsyncAwaitUtils-getBoolValueWithAsync--- $value"));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              height: 40,
              alignment: Alignment.center,
              child: const Text(
                "Future-加上async",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
