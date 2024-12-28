
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/animated_list_widget.dart';


/*
* 1.默认构造函数 : 适合少量且已知的子组件，同样具有懒加载模型
* 2.ListView.builder : 适合列表项比较多或者列表项不确定的情况
* 3.ListView.separated : 可以在生成的列表项之间添加一个分割组件
* 4.固定高度列表 : prototypeItem(推荐) | itemExtent  字widget高度获得宽度固定，从而提高性能
*
* 注意
* 1.ListView 中的列表项组件都是 RenderBox，并不是 Sliver， 这个一定要注意
* 2.一个 ListView 中只有一个Sliver，对列表项进行按需加载的逻辑是 Sliver 中实现的
*
* */

class ListViewPageWidget extends StatefulWidget {
  const ListViewPageWidget({super.key});

  @override
  State<ListViewPageWidget> createState() => _ListViewPageWidgetState();
}

class _ListViewPageWidgetState extends State<ListViewPageWidget> {
  final _words = <String>["end"];
  final ScrollController _scrollController = ScrollController();
  bool showBnt = false;
  String _progress = "0%";

  @override
  void initState() {
    _scrollController.addListener(() {
      if(_scrollController.offset > 1000 && !showBnt) {
        setState(() {
          showBnt = true;
        });
      }
      if(_scrollController.offset < 1000 && showBnt) {
        setState(() {
          showBnt = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget divider1 = const Divider(color: Colors.blue);
    Widget divider2 = const Divider(color: Colors.green);
    return Scaffold(
      body: PageView(
        children: [buildColumnOne(divider1, divider2), buildColumnTwo(),buildColumnThree()],
      ),
    );
  }

  Column buildColumnTwo() {
    return Column(children: [
      Container(
          height: 300,
          color: Colors.white,
          child: Stack(children: [
            ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  if (_words[index] == "end") {
                    if (_words.length <= 100) {
                      //更新数据
                      _loadItems();
                      //返回加载样式
                      return Center(child: Container(
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            child: CircularProgressIndicator(strokeWidth: 2.0),
                          )));
                    } else {
                      return Container(
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: const Text("已经没有更多数据了",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 10,
                                  decoration: TextDecoration.none)));
                    }
                  } else {
                    return Center(
                        child: Text("number-$index",
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                decoration: TextDecoration.none)));
                  }
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(color: Colors.red);
                },
                itemCount: _words.length),
          ])),
      SizedBox(
          height: 250,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            double height = constraints.maxHeight;
            double width = constraints.maxWidth;
            return Stack(children: [
              ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: Text(
                      "controller-$index",
                      style: const TextStyle(color: Colors.red, fontSize: 15, decoration: TextDecoration.none),
                    ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(height: 2,color: Colors.blue);
                  },
                  padding: const EdgeInsets.all(0),
                  controller: _scrollController,
                  itemCount: 200),
              if(showBnt) Positioned(bottom: height/2,right: 0,child: GestureDetector(onTap: (){ _scrollController.animateTo(0, duration: const Duration(milliseconds: 1000), curve: Curves.ease); },child: Container(color: Colors.red,height: 20,width: 20)))
            ]);
          })),
      Expanded(
        child: Scrollbar(
          thumbVisibility: true,
          child: NotificationListener<ScrollNotification>(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Stack(children: [
                ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Text("$index",
                        style: const TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 15));
                  },
                  itemCount: 100,
                  itemExtent: 50,
                ),
                Center(
                    child: CircleAvatar(
                  //显示进度百分比
                  radius: 30.0,
                  backgroundColor: Colors.black54,
                  child: Text(_progress,
                      style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.none,
                          fontSize: 20)),
                )),
              ]),
            ),
            onNotification: (ScrollNotification notification) {
              double progress = notification.metrics.pixels /
                  notification.metrics.maxScrollExtent;
              setState(() {
                _progress = "${(progress * 100).toInt()}%";
              });
              return false;
            },
          ),
        ),
      ),
    ]);
  }

  Column buildColumnOne(Widget divider1, Widget divider2) {
    return Column(children: [
      Container(
          color: Colors.amberAccent,
          height: 200,
          width: double.infinity,
          child: ListView(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              children: const [
                Center(
                    child: Text("A",
                        style: TextStyle(decoration: TextDecoration.none))),
                Center(
                    child: Text("A",
                        style: TextStyle(decoration: TextDecoration.none))),
                Center(
                    child: Text("A",
                        style: TextStyle(decoration: TextDecoration.none))),
                Center(
                    child: Text("A",
                        style: TextStyle(decoration: TextDecoration.none))),
                Center(
                    child: Text("A",
                        style: TextStyle(decoration: TextDecoration.none))),
                Center(
                    child: Text("A",
                        style: TextStyle(decoration: TextDecoration.none))),
                Center(
                    child: Text("A",
                        style: TextStyle(decoration: TextDecoration.none))),
                Center(
                    child: Text("A",
                        style: TextStyle(decoration: TextDecoration.none))),
                Center(
                    child: Text("A",
                        style: TextStyle(decoration: TextDecoration.none))),
              ])),
      Container(
          height: 200,
          color: Colors.red,
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Center(
                    child: Text("item - $index",
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white)));
              },
              itemCount: 100,
              padding: const EdgeInsets.all(20))),
      Container(
          height: 200,
          color: Colors.grey,
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: Text("分割线-$index",
                      style: const TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.red,
                          fontSize: 10)));
            },
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? divider1 : divider2;
            },
            itemCount: 100,
            padding: const EdgeInsets.all(0),
          )),
      Expanded(
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Center(
                    child: Text("固定高度-$index",
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 10)));
              },
              itemCount: 100,
              padding: const EdgeInsets.all(0),
              prototypeItem: const Text("固定高度",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 10))))
    ]);
  }

  Widget buildColumnThree() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top,),
        const Text(
          "AnimatedList",
          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),
        ),
        const AnimatedListWidget(),
      ],
    );
  }

  void _loadItems() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      for (int i = 0; i < 20; i++) {
        _words.insert(_words.length-1, getRandomChar());
      }
      setState(() {  });
    });
  }

  String getRandomChar() {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    int randomIndex = random.nextInt(chars.length);
    return chars[randomIndex];
  }

}
