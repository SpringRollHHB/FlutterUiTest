import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/tool/count_get_controller.dart';
import 'package:get/get.dart';

class GetXCountPage extends StatefulWidget {
  static const name = "/GetXCountPage";
  const GetXCountPage({super.key});

  @override
  State<GetXCountPage> createState() => _GetXCountPageState();
}

class _GetXCountPageState extends State<GetXCountPage> {

  CountGetController countGetController = Get.find<CountGetController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              print("hhbggg 111");
              return Text(countGetController.name.value,style: const TextStyle(color: Colors.white,fontSize: 30),);
            }),
            const SizedBox(height: 10,),
            Obx(() {
              print("hhb nnn 22");
              return Text("${countGetController.count.value}",style: const TextStyle(color: Colors.white,fontSize: 30),);
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countGetController.add();
          countGetController.changeName();
        },
        child: const Text("加1",style: TextStyle(color: Colors.red,fontSize: 20),),
      ),
    );
  }
}
