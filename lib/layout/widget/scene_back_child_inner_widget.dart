import 'package:flutter/material.dart';

class SceneBackChildInnerWidget extends StatefulWidget {
  final GlobalKey testKey;
  const SceneBackChildInnerWidget({super.key, required this.testKey});

  @override
  State<SceneBackChildInnerWidget> createState() => _SceneBackChildInnerWidgetState();
}

class _SceneBackChildInnerWidgetState extends State<SceneBackChildInnerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10)
      ),
      alignment: Alignment.center,
      child: Container(
        key: widget.testKey,
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
