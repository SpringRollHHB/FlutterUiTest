import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutteruitest/layout/animation_image.dart';
import 'package:flutteruitest/layout/widget/pro_animation_widget.dart';
import 'package:get/get.dart';

class DongHuaWidget extends StatefulWidget {
  const DongHuaWidget({super.key});

  @override
  State<DongHuaWidget> createState() => _DongHuaWidgetState();
}

class _DongHuaWidgetState extends State<DongHuaWidget> with TickerProviderStateMixin {

  late AnimationController controller01;
  late Animation<double> animation01;
  late Animation<double> animation02;

  late AnimationController controller02;
  late Animation<double> animation0201;
  late Animation<Color?> animation0202;
  late Animation<double> animation0203;

  var dy = 0.0.obs;
  var start = true.obs;
  var count = 0.obs;
  var count2 = 0.obs;
  var dirty01 = true;

  @override
  void initState() {
    super.initState();
    controller01 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation01 = CurvedAnimation(parent: controller01, curve: Curves.bounceIn);
    animation01 = Tween(begin: 0.0, end: 120.0).animate(animation01)
      ..addStatusListener((status) {

      })
      ..addListener(() {
        setState(() {});
      });
    animation02 = Tween(begin: 0.0,end: 120.0).animate(controller01)
      ..addStatusListener((status) {

      });

    controller02 = AnimationController(vsync: this,duration: const Duration(seconds: 4));
    animation0201 = Tween(begin: 10.0,end: 20.0).animate(CurvedAnimation(parent: controller02, curve: const Interval(0.0, 0.5,curve: Curves.ease)));
    animation0202 = ColorTween(begin: Colors.black,end: Colors.red).animate(CurvedAnimation(parent: controller02, curve: const Interval(curve: Curves.ease,0.0,0.5)),);
    animation0203 = Tween(begin: 0.0,end: 20.0).animate(CurvedAnimation(parent: controller02, curve: const Interval(0.5,1.0,curve: Curves.ease)));

  }

  @override
  void dispose() {
    super.dispose();
    controller01.dispose();
    controller02.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.yellow,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 0,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "动画",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  height: 1.0,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller01.forward();
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Text("开始",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller01.reset();
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Text("重置",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Image.asset(
              "images/caocao.webp",
              height: animation01.value,
              width: animation01.value,
            ),
            const SizedBox(height: 10,),
            AnimationImage(
              listenable: animation02,
            ),
            const SizedBox(height: 5,),
            AnimatedBuilder(
              animation: animation02,
              builder: (context, child) {
                return Image.asset(
                  "images/caocao.webp",
                  height: animation02.value,
                  width: animation02.value,
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => AnimatedContainer(
                  transform: Matrix4.translationValues(0, dy.value, 0),
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                    ),
                  ),
                ),),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    if (dy.value > 0) {
                      dy.value = 0;
                    } else {
                      dy.value = 20;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    width: 80,
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text("执行动画",style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: controller02,
                  builder: (BuildContext context, Widget? child) {
                    return Container(
                      margin: EdgeInsets.only(right: animation0203.value),
                      width: animation0201.value,
                      height: animation0201.value,
                      decoration: BoxDecoration(color: animation0202.value, shape: BoxShape.circle),
                    );
                  },
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    if(controller02.status == AnimationStatus.completed) {
                      controller02.reverse();
                    }

                    if(controller02.status == AnimationStatus.dismissed) {
                      controller02.forward();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    width: 80,
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text("交织动画",style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  return Container(
                    height: 26,
                    width: 66,
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      reverseDuration: const Duration(seconds: 1),
                      child: Container(
                        key: Key("${DateTime.now().millisecondsSinceEpoch}-${start.value}"),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: start.value ? Colors.white : Colors.red,
                        ),
                      ),
                      transitionBuilder: (Widget _child, Animation<double> animation) {
                        var marginLeft = Tween(begin: 0.0,end: 40.0).animate(animation);
                        return AnimatedBuilder(
                            animation: animation,
                            builder: (BuildContext context, Widget? child) {
                              return Container(
                                margin: EdgeInsets.only(left: marginLeft.value),
                                child: _child,
                              );
                            });
                      },
                    ),
                  );
                }),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    start.value = !start.value;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text("AnimatedSwitcher-不好用",style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Obx(() {
                    return AnimatedSwitcher(
                      duration:  const Duration(seconds: 1),
                      reverseDuration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget _child, Animation<double> animation) {
                        var a = Tween<double>(begin: 0.0,end: 4.0).animate(animation);
                        return ScaleTransition(scale: a,child: _child,);
                      },
                      child: Text("$count",style: const TextStyle(color: Colors.white,fontSize: 10),key: Key(count.toString()),),
                    );
                  }),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    count.value = count.value +1;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text("AnimatedSwitcher-count",style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Obx(() {
                    return AnimatedSwitcher(
                      duration:  const Duration(seconds: 1),
                      transitionBuilder: (Widget _child, Animation<double> animation) {

                        var a = Tween<Offset>(begin: const Offset(0,1.5),end: const Offset(0,0)).animate(animation);
                        var b = Tween(begin: 0.0,end: 3.3).animate(animation);

                        return AnimatedBuilder(animation: a, builder: (BuildContext context, Widget? child) {
                          var offset1 = a.value;
                          if(animation.status == AnimationStatus.reverse) offset1 = Offset(-a.value.dx, -a.value.dy);

                          return Transform.scale(
                            scale: b.value,
                            child: FractionalTranslation(
                              translation: offset1,
                              transformHitTests: true,
                              child: _child,
                            ),
                          );
                        },);
                      },
                      child: Text("$count2",style: const TextStyle(color: Colors.white,fontSize: 10),key: Key(count2.toString()),),
                    );
                  }),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    count2.value = count2.value + 1;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text("AnimatedSwitcher-平移",style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter _setState) {
                return GestureDetector(
                  onTap: (){
                    _setState((){
                      dirty01 = !dirty01;
                    });
                  },
                  child: ProAnimationWidget(dirty: dirty01,),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
