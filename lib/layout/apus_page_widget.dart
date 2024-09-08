import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/custom_page_widget.dart';
import 'package:flutteruitest/layout/home_page_widget.dart';
import 'package:flutteruitest/layout/template/list_page_widget.dart';

import 'color_filter_image_widget.dart';

class ApusPageWidget extends ListPageWidget {


  ApusPageWidget({super.key, required super.backColor, required super.itemBackColor, required super.fontColor, required super.fontSize});

  @override
  setList(BuildContext context) {
    list.add(HomeItem(title: "CustomScrollView", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const CustomPageWidget()));  }));
    list.add(HomeItem(title: "过滤图片颜色", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const ColorFilterImageWidget()));  }));
  }

  

}

