import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/state/tap_box_c_c.dart';

class TapBoxC extends StatefulWidget {
  const TapBoxC({super.key});

  @override
  State<TapBoxC> createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {

  bool active = false;

  void changeActive(bool value) {
    setState(() {
      active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxCC(active: active, actionBack: changeActive);
  }
}



