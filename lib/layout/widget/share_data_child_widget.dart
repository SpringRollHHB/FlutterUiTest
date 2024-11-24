import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/share_data_widget.dart';

class ShareDataChildWidget extends StatefulWidget {
  const ShareDataChildWidget({super.key});

  @override
  State<ShareDataChildWidget> createState() => _ShareDataChildWidgetState();
}

class _ShareDataChildWidgetState extends State<ShareDataChildWidget> {

  @override
  void initState() {
    super.initState();
    debugPrint("ShareDataChildWidget initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("ShareDataChildWidget  didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    //build中必须引用->ShareDataWidget.of(context)?.data
    //ShareDataWidget.of(context)?.data.toString() ??
    debugPrint("ShareDataChildWidget  build data:");
    return Text(ShareDataWidget.of(context)?.data.toString() ??"-1",style: TextStyle(color: Colors.blue.shade500,fontSize: 15),);
  }
}
