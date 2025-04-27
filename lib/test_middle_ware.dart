import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TestMiddleWare extends GetMiddleware {

  //中间件 还有其他的回调函数 用的时候可以查看API
  @override
  RouteSettings? redirect(String? route) {
    //重定位技术
    debugPrint("可以做登录的中间件....");
    // return const RouteSettings(name: '/loginPage',arguments: "nihao"); //跳转到指定页面
    return null; //不做什么拦截
  }
}