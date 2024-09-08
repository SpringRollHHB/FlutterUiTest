import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/state_recycle_test_widget.dart';
import 'package:flutteruitest/layout/template/list_page_widget.dart';
import 'counter_down_widget.dart';
import 'custom_page_widget.dart';
import 'get_state_widget.dart';
import 'home_page_widget.dart';

class WidgetTestPage extends ListPageWidget {

  WidgetTestPage({super.key, required super.backColor, required super.itemBackColor, required super.fontColor, required super.fontSize});

  @override
  setList(BuildContext context) {
    list.add(HomeItem(title: "SetState测试", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const CounterDownWidget()));  }));
    list.add(HomeItem(title: "State生命周期", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const StateRecycleTestWidget()));  }));
    list.add(HomeItem(title: "获取父级widget的state", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const GetStateWidget())); }));
  }

}

