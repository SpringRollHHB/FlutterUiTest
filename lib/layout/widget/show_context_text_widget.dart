import 'dart:async';

import 'package:flutter/material.dart';
import '../AsyncAwaitPage.dart';

class ShowContextTestWidget extends StatefulWidget {
  const ShowContextTestWidget({super.key});

  @override
  State<ShowContextTestWidget> createState() => _ShowContextTestWidgetState();
}

class _ShowContextTestWidgetState extends State<ShowContextTestWidget> {

  int count = 0;
  Timer? _timer; // 定时器

  @override
  void initState() {
    super.initState();
    debugPrint("ShowContextTestWidget initState()... ");
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        count++;
      });
    });
    Future.delayed(const Duration(seconds: 8)).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const AsyncWaitPage()),
      );
      // Get.toNamed(AsyncWaitPage.name);
    });
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("ShowContextTestWidget dispose()... ");
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      color: Colors.black,
      alignment: Alignment.center,
      child: Text(
        count.toString(),
        style: const TextStyle(color: Colors.white,fontSize: 10),
      ),
    );
  }


}
