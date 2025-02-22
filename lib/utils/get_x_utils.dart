import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXUtils {

  static showDefaultDialog() {
    Get.defaultDialog(
      title: "提示信息",
      middleText: "你确定要删除吗?",
      cancel: ElevatedButton(onPressed: () {
        Get.back();
      }, child: const Text("取消",style: TextStyle(color: Colors.blue,fontSize: 20),)),
      confirm: ElevatedButton(onPressed: () => Get.back(), child: const Text("确定",style: TextStyle(color: Colors.blue,fontSize: 20),))
    );
  }
  
  static showSnackBar() {
    Get.snackbar(
      "提示",
      "你还没有登陆",
      margin: const EdgeInsets.only(bottom: 20),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: Colors.black,
    );
  }

  static showBottomSheet() {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            const Spacer(),
            ElevatedButton(onPressed: () {
              Get.changeTheme(ThemeData.light());
              Get.back();
            }, child: Text("白天模式",style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black,fontSize: 20),)),
            const SizedBox(width: 10,),
            ElevatedButton(onPressed: () {
              Get.changeTheme(ThemeData.dark());
              Get.back();
            }, child: Text("黑夜模式",style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black,fontSize: 20),)),
            const Spacer(),
          ],
        ),
      )
    );
  }

}