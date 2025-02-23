import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_base_bean.dart';

class GetXStatusManagerOnePage extends StatefulWidget {
  static const String name = "/GetXStatusManagerOnePage";
  const GetXStatusManagerOnePage({super.key});

  @override
  State<GetXStatusManagerOnePage> createState() => _GetXStatusManagerOnePageState();
}

class _GetXStatusManagerOnePageState extends State<GetXStatusManagerOnePage> {

  final RxInt _count = 0.obs; //响应式变量
  final RxString _name = "hhb".obs;
  final PersonGetX personGetX = PersonGetX();
  var studentGetX = StudentGetX(name: "小明",age: 18).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                  () {
                    debugPrint("obx1 ---- count");
                    return Text(
                      _count.value.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    );
                  },
            ),
            const SizedBox(height: 20,),
            Obx(() {
              debugPrint("obx1 ---- name");
              return Text(_name.value.toString(),style: const TextStyle(color: Colors.white,fontSize: 18),);
            }),
            const SizedBox(height: 20,),
            Obx(() {
              debugPrint("obx1 ---- personGetx");
              return Text("${personGetX.name.value}-->${personGetX.age.toString()}",style: const TextStyle(color: Colors.white,fontSize: 18),);
            }),
            const SizedBox(height: 20,),
            Obx(() {
              debugPrint("obx1 ---- studentGetx");
              return Text("${studentGetX.value.name}<--${studentGetX.value.age}",style: const TextStyle(color: Colors.white,fontSize: 18),);
            }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          FloatingActionButton(
            onPressed: () {
              _count.value++;
            },
            backgroundColor: Colors.white,
            child: const Text("加一",style: TextStyle(color: Colors.black,fontSize: 20,),),
          ),
          const SizedBox(width: 15,),
          FloatingActionButton(
            onPressed: () {
              _name.value = "hhb${Random().nextInt(10)}";
            },
            backgroundColor: Colors.white,
            child: const Text("名字",style: TextStyle(color: Colors.black,fontSize: 20,),),
          ),
          const SizedBox(width: 15,),
          FloatingActionButton(
            onPressed: () {
              personGetX.name.value = "变形金刚${Random().nextInt(100)}";
              personGetX.age.value = Random().nextInt(100);
            },
            backgroundColor: Colors.white,
            child: const Text("人",style: TextStyle(color: Colors.black,fontSize: 20,),),
          ),
          const SizedBox(width: 15,),
          FloatingActionButton(
            onPressed: () {
              studentGetX.value = StudentGetX(name: "小明${Random().nextInt(10)}",age: Random().nextInt(100));;
            },
            backgroundColor: Colors.white,
            child: const Text("学生",style: TextStyle(color: Colors.black,fontSize: 20,),),
          ),
        ],
      ),
    );
  }
}
