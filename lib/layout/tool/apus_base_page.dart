
import 'package:flutter/cupertino.dart';
import 'package:flutteruitest/layout/tool/mixin_action.dart';

abstract class ApusBasePageState<T extends StatefulWidget> extends State<T> with MixinAction{

  @override
  void initState() {
    debugPrint("父widget initState");
    super.initState();
    doApusAction();
  }

  final List<int> apusList = [];

  void doApusAction();


  @override
  int mixinAction() {
    return 1;
  }

}