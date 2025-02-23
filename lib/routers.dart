import 'package:flutter/cupertino.dart';
import 'package:flutteruitest/test_middle_ware.dart';
import 'package:get/get.dart';
import 'layout/get_x_count_page.dart';
import 'layout/get_x_route_one.dart';
import 'layout/get_x_status_manager_one.dart';
import 'layout/home_page_widget.dart';
import 'layout/widget/route/no_name_result_widget.dart';

class RouterPages {
  static final routers = [
    GetPage(name: "/", page: () => const HomePageWidget()),
    GetPage(
      name: NoNameResultWidget.name,
      page: () {
        debugPrint(
            "getPages NoNameResultWidget....  argument->${Get.arguments}");
        return NoNameResultWidget(
          showTitle: Get.arguments as String,
        );
      },
    ),
    GetPage(name: GetXCountPage.name, page: () => const GetXCountPage()),
    GetPage(name: GetXRouteOne.name, page: () => const GetXRouteOne(),middlewares: [ TestMiddleWare() ]),
    GetPage(name: GetXStatusManagerOnePage.name, page: () => const GetXStatusManagerOnePage())
  ];
}