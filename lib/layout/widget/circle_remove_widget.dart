import 'package:flutter/material.dart';

class CircleRemoveWidget extends StatefulWidget {
  const CircleRemoveWidget({super.key});

  @override
  State<CircleRemoveWidget> createState() => _CircleRemoveWidgetState();
}

class _CircleRemoveWidgetState extends State<CircleRemoveWidget> {
  double _top = 0.0;
  double _left = 0.0;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            Positioned(
              left: _left,
              top: _top,
              child: const CircleAvatar(child: Text("A")),
            ),
          ],
        ),
      ),
      onPanDown: (event) => debugPrint("CircleRemoveWidget  用户手指按下 ${event.globalPosition}"),
      onPanUpdate: (event) {
        debugPrint("CircleRemoveWidget 滑动 dy:${event.delta.dy}   dx:${event.delta.dx}");
        _top += event.delta.dy;
        _left += event.delta.dx;
        setState(() {

        });
      },
      onPanEnd: (event) => debugPrint("CircleRemoveWidget 滑动结束 ${event.velocity}"),
    );
  }
}
