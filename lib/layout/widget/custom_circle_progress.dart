import 'package:flutter/cupertino.dart';

class CustomCircleProgress extends StatefulWidget {
  final double strokeWidth;
  final double radius;
  final bool hasCapRound;
  final double currentValue;
  final Color backColor;
  final double totalAngle;


  const CustomCircleProgress({super.key, required this.strokeWidth, required this.radius, required this.hasCapRound, required this.currentValue, required this.backColor, required this.totalAngle});

  @override
  State<CustomCircleProgress> createState() => _CustomCircleProgressState();
}

class _CustomCircleProgressState extends State<CustomCircleProgress> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(widget.radius),
      painter: CircleProgressPainter(
        strokeWidth: widget.strokeWidth,
        radius: widget.radius,
        hasCapRound: widget.hasCapRound,
        currentValue: widget.currentValue,
        backColor: widget.backColor,
        totalAngle: widget.totalAngle,
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final bool hasCapRound;
  final double currentValue;
  final Color backColor;
  final double totalAngle;

  CircleProgressPainter({super.repaint, required this.strokeWidth, required this.radius, required this.hasCapRound, required this.currentValue, required this.backColor, required this.totalAngle});

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)  => false;

}
