import 'package:flutter/cupertino.dart';
import 'package:flutteruitest/test_middle_ware.dart';
import 'package:get/get.dart';
import 'layout/AsyncAwaitPage.dart';
import 'layout/channel_test_page.dart';
import 'layout/context_page.dart';
import 'layout/get_x_count_page.dart';
import 'layout/get_x_getview_page.dart';
import 'layout/get_x_route_one.dart';
import 'layout/get_x_status_manager_one.dart';
import 'layout/home_page_widget.dart';
import 'layout/tool/student_get_x_binging.dart';
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
    GetPage(name: ContextTestPage.name, page: () => const ContextTestPage()),
    GetPage(name: AsyncWaitPage.name, page: () => const AsyncWaitPage()),
    GetPage(name: ChannelTestPage.name, page: () => const ChannelTestPage()),
    GetPage(name: "/GetXGetViewPage", page: () => const GetXGetViewPage(),binding: StudentGetXBinding()),
    GetPage(name: GetXCountPage.name, page: () => const GetXCountPage()),
    GetPage(name: GetXRouteOne.name, page: () => const GetXRouteOne(),middlewares: [ TestMiddleWare() ]),
    GetPage(name: GetXStatusManagerOnePage.name, page: () => const GetXStatusManagerOnePage())
  ];
}