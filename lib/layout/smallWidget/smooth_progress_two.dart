import 'package:flutter/material.dart';

class SmoothProgressTwo extends StatefulWidget {
  final double progress;

  const SmoothProgressTwo({super.key, required this.progress});

  @override
  State<SmoothProgressTwo> createState() => _SmoothProgressTwoState();
}

class _SmoothProgressTwoState extends State<SmoothProgressTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: double.infinity,
      color: const Color(0xFFFFFFFF).withOpacity(0.4),
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth * widget.progress,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(2),
                bottomRight: Radius.circular(2),
              ),
            ),
          );
      },),
    );
  }
}
