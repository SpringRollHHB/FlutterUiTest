

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/apus_page_widget.dart';
import 'package:flutteruitest/layout/scrollable_page_widget.dart';
import 'package:flutteruitest/player.dart';

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
    list.add(HomeItem(title: "可滚动widget", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScrollablePageWidget(backColor: Colors.white,itemBackColor: Colors.black, fontColor: Colors.white,fontSize: 16))); }));
    list.add(HomeItem(title: "视频1", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Player(url: "https://www.w3schools.com/html/movie.mp4",))); }));
    list.add(HomeItem(title: "视频2", onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Player(url: "https://file.picku.cloud/40b977df/banner/ff01a42e9e59c244e824e4754a7f7d10.mp4",))); }));
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
