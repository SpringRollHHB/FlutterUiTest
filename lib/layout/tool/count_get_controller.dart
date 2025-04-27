// ignore: depend_on_referenced_packages
import 'dart:math';
import 'package:get/get.dart';

class CountGetController extends GetxController {

  RxInt count = 0.obs;
  String name = "小明1";

  void add() {
    count.value++;
  }

  void reduce() {
    count.value--;
  }

  void changeName() {
    name = "小明${Random().nextInt(1000)}";
    update();
  }


}