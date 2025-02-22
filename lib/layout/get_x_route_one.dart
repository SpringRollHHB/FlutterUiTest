import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXRouteOne extends StatefulWidget {
  static const String name = "/GetXRouteOne";
  const GetXRouteOne({super.key});

  @override
  State<GetXRouteOne> createState() => _GetXRouteOneState();
}

class _GetXRouteOneState extends State<GetXRouteOne> {

  @override
  void initState() {
    super.initState();
    debugPrint("GetXRouteOne....${Get.arguments}");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "GetX-路由-Get.arguments-1",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            height: 1.0,
          ),
        ),
      ),
    );
  }


}
