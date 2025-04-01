import 'package:flutter/material.dart';
import '../AsyncAwaitPage.dart';

class ShowContextTestWidget extends StatefulWidget {
  const ShowContextTestWidget({super.key});

  @override
  State<ShowContextTestWidget> createState() => _ShowContextTestWidgetState();
}

class _ShowContextTestWidgetState extends State<ShowContextTestWidget> {

  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      color: Colors.black,
    );
  }


}
