import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/template/list_page_widget.dart';
import 'counter_down_widget.dart';
import 'custom_page_widget.dart';
import 'home_page_widget.dart';

class WidgetTestPage extends ListPageWidget {

  WidgetTestPage({super.key, required super.backColor, required super.itemBackColor, required super.fontColor, required super.fontSize});

  @override
  setList(BuildContext context) {
    list.add(HomeItem(title: "SetState测试", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const CounterDownWidget()));  }));
  }

}

