import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page_widget.dart';

abstract class ListPageWidget extends StatefulWidget {

  var list = <HomeItem>[];

  final Color backColor;
  final Color itemBackColor;
  final Color fontColor;
  final double fontSize;

  ListPageWidget({super.key, required this.backColor, required this.itemBackColor, required this.fontColor, required this.fontSize});

  @override
  State<ListPageWidget> createState() => _ListPageWidgetState();

  setList(BuildContext context) ;
}

class _ListPageWidgetState extends State<ListPageWidget> {
  @override
  void initState() {
    super.initState();
    widget.setList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: widget.backColor,
      child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: widget.list[index].onTap,
                child: Container(
                    decoration: BoxDecoration(
                        color: widget.itemBackColor,
                        borderRadius: BorderRadius.circular(7)),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                        child: Text(widget.list[index].title,
                            style: TextStyle(
                                color: widget.fontColor,
                                fontSize: widget.fontSize,
                                decoration: TextDecoration.none)))));
          }),
    );
  }
}
