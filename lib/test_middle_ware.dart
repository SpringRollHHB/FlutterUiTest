import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TestMiddleWare extends GetMiddleware {

  //中间件
  @override
  RouteSettings? redirect(String? route) {
    debugPrint("可以做登录的中间件....");
    // return const RouteSettings(name: '/loginPage',arguments: "nihao"); //跳转到指定页面
    return null; //不做什么拦截
  }
}