import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChessPieceWidget extends StatefulWidget {
  const ChessPieceWidget({super.key});

  @override
  State<ChessPieceWidget> createState() => _ChessPieceWidgetState();
}

class _ChessPieceWidgetState extends State<ChessPieceWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300,300),
      painter: ChessPiecePainter(),
    );
  }
}

class ChessPiecePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    //画棋盘
    var paintBack = Paint()
      ..color = const Color(0xFFDCC48C)
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paintBack);

    var paintLine = Paint()
      ..strokeWidth = 1.0
      ..color = Colors.black38
      ..style = PaintingStyle.stroke;

    for(int i = 0 ; i <= 15 ; i++) {
      double dy = rect.top + rect.height / 15 * i;
      canvas.drawLine(Offset(rect.left, dy),Offset(rect.right, dy), paintLine);
    }

    for(int i = 0 ; i <= 15 ; i++) {
      double dx = rect.left + rect.width / 15 * i;
      canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paintLine);
    }

    //画棋子
    double itemH = rect.height / 15;
    double itemW = rect.width / 15;
    //画一个黑子
    var blackPiecePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(rect.center.dx - itemW/2, rect.center.dy - itemH/2), min(itemH/2, itemW/2) - 2, blackPiecePaint);
    //画一个白子
    var whitePiecePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(rect.center.dx + itemW/2, rect.center.dy + itemH/2), min(itemW/2, itemH/2)-2, whitePiecePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}
