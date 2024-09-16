import 'package:flutter/material.dart';
import '../../home_page_widget.dart';
import '../../template/list_page_widget.dart';
import 'no_name_result_widget.dart';
import 'no_name_route_test_widget.dart';

class RouteManageWidget extends ListPageWidget {
  RouteManageWidget({super.key, required super.backColor, required super.itemBackColor, required super.fontColor, required super.fontSize});

  @override
  setList(BuildContext context) {
    list.add(HomeItem(title: "非命名路由传值", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const NoNameRouteWidget()));}));
    list.add(HomeItem(title: "命名路由-push-参数", onTap: () { Navigator.of(context).pushNamed(NoNameResultWidget.name,arguments: "传递参数"); }));
    list.add(HomeItem(title: "命名路由-钩子", onTap: () { Navigator.of(context).pushNamed("hhb",arguments: "路由-钩子"); }));
  }

}

