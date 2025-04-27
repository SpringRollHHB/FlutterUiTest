import 'package:flutter/material.dart';
import '../../get_x_route_one.dart';
import '../../home_page_widget.dart';
import '../../template/list_page_widget.dart';
import 'no_name_result_widget.dart';
import 'no_name_route_test_widget.dart';
import 'package:get/get.dart';

class RouteManageWidget extends ListPageWidget {
  RouteManageWidget({super.key, required super.backColor, required super.itemBackColor, required super.fontColor, required super.fontSize});

  @override
  setList(BuildContext context) {
    list.add(HomeItem(title: "非命名路由传值", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const NoNameRouteWidget()));}));
    list.add(HomeItem(title: "命名路由-push-参数", onTap: () { Get.toNamed(NoNameResultWidget.name,arguments: "传递参数")?.then((v) {
      debugPrint("获取页面返回值 value:$v");
    }); }));
    list.add(HomeItem(title: "命名路由-钩子", onTap: () { Navigator.of(context).pushNamed("hhb",arguments: "路由-钩子"); }));
    list.add(HomeItem(title: "命名路由-getX-one", onTap: () { Get.toNamed(GetXRouteOne.name,arguments: {"1":"one"}); }));
  }

}

