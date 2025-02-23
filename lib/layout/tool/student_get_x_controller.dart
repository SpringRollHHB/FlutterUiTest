import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StudentGetXController extends GetxController {

  RxString studentName = "小红".obs;

  void changeName() {
    studentName.value = "小红${Random().nextInt(100)}";
  }

  @override
  void onInit() {
    debugPrint("StudentGetXController  onInit");
    super.onInit();
  }

  @override
  void onReady() {
    debugPrint("StudentGetXController  onReady");
    super.onReady();
  }


  @override
  void onClose() {
    debugPrint("StudentGetXController  onClose");
    super.onClose();
  }

}