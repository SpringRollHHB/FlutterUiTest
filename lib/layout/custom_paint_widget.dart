import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/chess_piece_widget.dart';

class CustomPaintWidget extends StatefulWidget {
  const CustomPaintWidget({super.key});

  @override
  State<CustomPaintWidget> createState() => _CustomPaintWidgetState();
}

class _CustomPaintWidgetState extends State<CustomPaintWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top,width: double.infinity,),
            const ChessPieceWidget(),
          ],
        ),
      ),
    );
  }
}
