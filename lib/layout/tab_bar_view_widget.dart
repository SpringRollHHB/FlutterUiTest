import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarViewWidget extends StatefulWidget {
  const TabBarViewWidget({super.key});

  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget> with SingleTickerProviderStateMixin {

  late TabController _tabBarControllerOne;
  List tabOne = ["关羽","张飞","赵云","吕布","曹操","刘备"];
  List tabViewOne = ["images/guanyu.webp","images/zhangfei.webp","images/zhaoyun.webp","images/lvbu.webp","images/caocao.webp","images/liubei.webp"];

  @override
  void initState() {
    super.initState();
    _tabBarControllerOne = TabController(length: tabOne.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabBarControllerOne.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              padding: const EdgeInsets.symmetric(vertical: 5),
              controller: _tabBarControllerOne,
              tabs: buildTabsOne(),
              labelStyle: const TextStyle(color: Colors.green, fontSize: 12),
              unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 12),
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              dividerColor: Colors.transparent,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: TabBarView(
                key: UniqueKey(),
                controller: _tabBarControllerOne,
                children: buildTabViewOne(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildTabsOne() {
    List<Widget> resultList = [];

    for (var value in tabOne) {
      resultList.add(Container(
        height: 46,
        alignment: Alignment.center,
        child: Text(
          value,
        ),
      ));
    }

    return resultList;
  }

  List<Widget> buildTabViewOne() {
    List<Widget> resultList = [];
    for (var value in tabViewOne) {
      resultList.add(Image.asset(value));
    }
    return resultList;
  }

}
