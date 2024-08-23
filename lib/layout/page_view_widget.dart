import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/*
* pageView默认是没有缓存功能，每次滑动都有销毁和创建新的pageView
* */
class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 200,
            child: PageView(
              pageSnapping: false,
              children: [
                Container(color: Colors.white,child: const Center(child: Text(
                  "1",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),),),
                Container(
                  color: Colors.black,
                  child: const Center(child: Text(
                    "2",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),),
                ),
                Container(
                  color: Colors.blue,
                  child: const Center(child: Text(
                    "3",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),),
                ),
                Container(
                  color: Colors.amber,
                  child: const Center(child: Text(
                    "4",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
