
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*
* 1.默认构造函数 : 适合少量且已知的子组件，同样具有懒加载模型
* 2.ListView.builder : 适合列表项比较多或者列表项不确定的情况
* 3.ListView.separated : 可以在生成的列表项之间添加一个分割组件
* 4.固定高度列表 : prototypeItem(推荐) | itemExtent  字widget高度获得宽度固定，从而提高性能
*
* */

class ListViewPageWidget extends StatelessWidget {

  const ListViewPageWidget({super.key});


  @override
  Widget build(BuildContext context) {
    Widget divider1 = const Divider(color: Colors.blue);
    Widget divider2 = const Divider(color: Colors.green);
    return Column(children: [
      Container(
          color: Colors.amberAccent,
          height: 200,
          width: double.infinity,
          child: ListView(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              children: const [
                Center(child: Text("A",
                    style: TextStyle(decoration: TextDecoration.none))),
                Center(child: Text("A",
                    style: TextStyle(decoration: TextDecoration.none))),
                Center(child: Text("A",
                    style: TextStyle(decoration: TextDecoration.none))),
                Center(child: Text("A",
                    style: TextStyle(decoration: TextDecoration.none))),
                Center(child: Text("A",
                    style: TextStyle(decoration: TextDecoration.none))),
                Center(child: Text("A",
                    style: TextStyle(decoration: TextDecoration.none))),
                Center(child: Text("A",
                    style: TextStyle(decoration: TextDecoration.none))),
                Center(child: Text("A",
                    style: TextStyle(decoration: TextDecoration.none))),
                Center(child: Text("A",
                    style: TextStyle(decoration: TextDecoration.none))),
              ])),
      Container(height: 200,
          color: Colors.red,
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Center(child: Text("item - $index", style: const TextStyle(decoration: TextDecoration.none,color: Colors.white)));
              }, itemCount: 10,padding: const EdgeInsets.all(20))),
      Container(
          height: 200,
          color: Colors.grey,
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Center(child: Text("分割线-$index",
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
}
