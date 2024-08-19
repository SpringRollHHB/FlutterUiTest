import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*
*  SingleChildScrollView不支持基于sliver的延时加载模型，因此如何期望内容超出屏幕太多的时候，性能会非常的差。
* */
class SingleChildrenScrollViewWidget extends StatelessWidget {
  const SingleChildrenScrollViewWidget({super.key});

  final String str = "ABCDEFGHIGKLMOPQRSTUVWXYZABCDEFGHIGKLMOPQRSTUVWXYZABCDEFGHIGKLMOPQRSTUVWXYZABCDEFGHIGKLMOPQRSTUVWXYZABCDEFGHIGKLMOPQRSTUVWXYZABCDEFGHIGKLMOPQRSTUVWXYZ";

  @override
  Widget build(BuildContext context) {
    return Scrollbar( //显示滚动条
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
                child: Column(
                    children: str
                        .split("")
                        .map((e) => Text(e,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 40,
                                decoration: TextDecoration.none)))
                        .toList()))));
  }
}
