import 'package:flutter/material.dart';

class CalTextHeightWidthWidget extends StatefulWidget {
  const CalTextHeightWidthWidget({super.key});

  @override
  State<CalTextHeightWidthWidget> createState() => _CalTextHeightWidthWidgetState();
}

class _CalTextHeightWidthWidgetState extends State<CalTextHeightWidthWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10)
      ),
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text("一行文本的宽高",style: TextStyle(color: Colors.white,fontSize: 15,),),
          const SizedBox(height: 10,),
          Text(
            "一行文本的宽高为 ${getWidthHeight("一行文本的宽高", const TextStyle(color: Colors.white,fontSize: 15,),1).first}-${getWidthHeight("一行文本的宽高", const TextStyle(color: Colors.white,fontSize: 15,),1).last}",
            style: const TextStyle(color: Colors.red,fontSize: 15),
          ),
          const SizedBox(height: 10,),
          const Text("二行\n文本的宽高",style: TextStyle(color: Colors.white,fontSize: 15,),),
          Text(
            "一行文本的宽高为 ${getWidthHeight("二行\n文本的宽高", const TextStyle(color: Colors.white,fontSize: 15,),2).first}-${getWidthHeight("二行\n文本的宽高", const TextStyle(color: Colors.white,fontSize: 15,),2).last}",
            style: const TextStyle(color: Colors.red,fontSize: 15),
          ),
        ],
      ),
    );
  }

  List<double> getWidthHeight(String text,TextStyle style,lineCount) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: lineCount,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return [textPainter.size.width,textPainter.size.height];
  }
}
