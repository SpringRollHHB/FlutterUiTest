import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/animation_image.dart';

class DongHuaWidget extends StatefulWidget {
  const DongHuaWidget({super.key});

  @override
  State<DongHuaWidget> createState() => _DongHuaWidgetState();
}

class _DongHuaWidgetState extends State<DongHuaWidget> with SingleTickerProviderStateMixin {

  late AnimationController controller01;
  late Animation<double> animation01;
  late Animation<double> animation02;

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
  }

  @override
  void dispose() {
    super.dispose();
    controller01.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 5,),
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
            const SizedBox(height: 10,),
            AnimatedBuilder(
              animation: animation02,
              builder: (context, child) {
                return Image.asset(
                  "images/caocao.webp",
                  height: animation02.value,
                  width: animation02.value,
                );
              },
            )

          ],
        ),
      ),
    );
  }
}
