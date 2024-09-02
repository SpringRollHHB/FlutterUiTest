import 'package:flutter/material.dart';

class SmoothProgress extends CustomPainter {
  final double progress;

  SmoothProgress(this.progress);

  animateToProgress() {

  }


  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    Rect rect = Rect.fromLTWH(
      0,
      0,
      size.width * progress,
      size.height,
    );

    RRect rrect = RRect.fromRectAndCorners(
      rect,
      topRight: const Radius.circular(2),
      bottomRight: const Radius.circular(2),
    );

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }


}
