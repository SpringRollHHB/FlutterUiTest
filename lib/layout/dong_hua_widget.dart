import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DongHuaWidget extends StatefulWidget {
  const DongHuaWidget({super.key});

  @override
  State<DongHuaWidget> createState() => _DongHuaWidgetState();
}

class _DongHuaWidgetState extends State<DongHuaWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1300), // 动画时长
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut, // 使用 easeInOut 曲线
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ScaleTransition(
        scale: Tween(begin: 1.0,end: 1.06).animate(_animation),
        child: buildCenter(),
      ),
    );
  }

  Center buildCenter() {
    return Center(
      child: Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xFF1BC43A),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/ic_record_camera.webp",
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                "Start Diagnose",
                style: TextStyle(
                    decoration: null,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
