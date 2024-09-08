import 'package:flutter/material.dart';

class ColorFilterImageWidget extends StatefulWidget {
  const ColorFilterImageWidget({super.key});

  @override
  State<ColorFilterImageWidget> createState() => _ColorFilterImageWidgetState();
}

class _ColorFilterImageWidgetState extends State<ColorFilterImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top,width: double.infinity,),
            _buildColorFiltered(),
          ],
        ),
      ),
    );
  }

  Widget _buildColorFiltered() {
    return Container(
      color: Colors.green,
      height: 150,
      width: 150,
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcOut,
        ),
        child: Image.asset(
          "images/ic_water_dolphin.webp.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
