import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'no_name_result_widget.dart';

class NoNameRouteWidget extends StatefulWidget {
  const NoNameRouteWidget({super.key});

  @override
  State<NoNameRouteWidget> createState() => _NoNameRouteWidgetState();
}

class _NoNameRouteWidgetState extends State<NoNameRouteWidget> {

  String result = "null";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(result,style: const TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.w600,decoration: TextDecoration.none),),
          GestureDetector(
            onTap: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const NoNameResultWidget(showTitle: '点击返回结果',);
                  },
                ),
              ).then((value) {
                String str = value as String;
                setState(() {
                  result = str;
                });
              });
            },
            child: const Text(
              "点击",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
