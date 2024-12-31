import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/custom_page_widget.dart';
import 'package:flutteruitest/layout/home_page_widget.dart';
import 'package:flutteruitest/layout/scene_back_page.dart';
import 'package:flutteruitest/layout/template/list_page_widget.dart';

import '../player.dart';
import 'color_filter_image_widget.dart';

class ApusPageWidget extends ListPageWidget {


  ApusPageWidget({super.key, required super.backColor, required super.itemBackColor, required super.fontColor, required super.fontSize});

  @override
  setList(BuildContext context) {
    list.add(HomeItem(title: "CustomScrollView", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const CustomPageWidget()));  }));
    list.add(HomeItem(title: "过滤图片颜色", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const ColorFilterImageWidget()));  }));
    list.add(HomeItem(title: "视频1", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Player(url: "https://www.w3schools.com/html/movie.mp4",)));  }));
    list.add(HomeItem(title: "视频2", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Player(url: "https://file.picku.cloud/40b977df/banner/ff01a42e9e59c244e824e4754a7f7d10.mp4",)));  }));
    list.add(HomeItem(title: "场景还原", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const SceneBackPage()));  }));
  }

  

}

