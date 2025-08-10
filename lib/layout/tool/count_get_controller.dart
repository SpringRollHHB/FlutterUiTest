// ignore: depend_on_referenced_packages
import 'dart:math';
import 'package:get/get.dart';

class CountGetController extends GetxController {

  RxInt count = 0.obs;
  RxString name = "小明1".obs;

  void add() {
    count.value++;
  }

  void reduce() {
    count.value--;
  }

  void changeName() {
    name.value = "小明${Random().nextInt(1000)}";
  }

  @override
  void onInit() {
    //只会执行一次，推荐使用
    super.onInit();
  }

  @override
  void onReady() {
    //只会执行一次
    super.onReady();
  }

  @override
  void onClose() {
    //通过单独路由绑定的controller,当执行get.back()退出路由的时候会执行
    super.onClose();
  }



}