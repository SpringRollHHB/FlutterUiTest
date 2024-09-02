import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/custom_page_widget.dart';
import 'package:flutteruitest/layout/home_page_widget.dart';
import 'package:flutteruitest/layout/plugin/video_player_plugin.dart';
import 'package:flutteruitest/layout/template/list_page_widget.dart';
import 'apus_video_player_heng.dart';
import 'dong_hua_widget.dart';

class ApusPageWidget extends ListPageWidget {


  ApusPageWidget({super.key, required super.backColor, required super.itemBackColor, required super.fontColor, required super.fontSize});

  @override
  setList(BuildContext context) {
    list.add(HomeItem(title: "CustomScrollView", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const CustomPageWidget()));  }));
    list.add(HomeItem(title: "动画实现", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const DongHuaWidget()));  }));
    list.add(HomeItem(title: "视频-横屏", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const ApusVideoPlayerH()));  }));
    list.add(HomeItem(title: "视频-IOS", onTap: () {
      //跳转到IOS原生页面
      VideoPlayerPlugin.navigateToNativePage();
    }));
  }

  

}

