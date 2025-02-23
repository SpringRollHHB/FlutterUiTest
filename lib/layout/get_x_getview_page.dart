import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/tool/count_get_controller.dart';
import 'package:flutteruitest/layout/tool/student_get_x_controller.dart';
import 'package:get/get.dart';

class GetXGetViewPage extends GetView<StudentGetXController> {
  static const name = "/GetXGetViewPage";
  const GetXGetViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Obx(() => Text(
          controller.studentName.value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.changeName(),
        backgroundColor: Colors.black,
        child: const Text("改名",style: TextStyle(color: Colors.white,fontSize: 15),),
      ),
    );
  }

}