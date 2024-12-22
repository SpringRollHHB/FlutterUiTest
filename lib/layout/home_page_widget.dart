

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/apus_page_widget.dart';
import 'package:flutteruitest/layout/scrollable_page_widget.dart';
import 'package:flutteruitest/layout/widget/baseComponent/base_component_widget.dart';
import 'package:flutteruitest/layout/widget/route/route_manage_widget.dart';
import 'package:flutteruitest/layout/widget_test_Page.dart';
import 'package:flutteruitest/player.dart';

import 'custom_paint_widget.dart';
import 'dong_hua_widget.dart';
import 'event_handling_notification_page.dart';
import 'file_network_action_page.dart';

class HomePageWidget extends StatefulWidget {

  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  final list = <HomeItem>[];

  @override
  void initState() {
    super.initState();
    list.add(HomeItem(title: "APUS", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ApusPageWidget(backColor: Colors.white,itemBackColor: Colors.black, fontColor: Colors.white,fontSize: 16))); }));
    list.add(HomeItem(title: "Widget", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => WidgetTestPage(backColor: Colors.white,itemBackColor: Colors.black, fontColor: Colors.white,fontSize: 16))); }));
    list.add(HomeItem(title: "可滚动widget", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScrollablePageWidget(backColor: Colors.white,itemBackColor: Colors.black, fontColor: Colors.white,fontSize: 16))); }));
    list.add(HomeItem(title: "路由传值", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => RouteManageWidget(backColor: Colors.white,itemBackColor: Colors.black, fontColor: Colors.white,fontSize: 16))); }));
    list.add(HomeItem(title: "基础组件", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const BaseComponentWidget())); }));
    list.add(HomeItem(title: "自定义组件-CustomPaint", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const CustomPaintWidget())); }));
    list.add(HomeItem(title: "动画", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const DongHuaWidget())); }));
    list.add(HomeItem(title: " 事件处理与通知", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const EventHandlingNotificationPage())); }));
    list.add(HomeItem(title: " 文件操作与网络操作", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const FileNetworkActionPage())); }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: list[index].onTap,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7)),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                        child: Text(list[index].title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                decoration: TextDecoration.none)))));
          }),
    );
  }
}

class HomeItem {
  final String title;
  final GestureTapCallback onTap;

  HomeItem({required this.title, required this.onTap});
}
