import 'package:flutter/cupertino.dart';
import 'package:flutteruitest/layout/widget/state/tap_box_a.dart';
import 'package:flutteruitest/layout/widget/state/tap_box_b.dart';
import 'package:flutteruitest/layout/widget/state/tap_box_c.dart';

class StateManageWidget extends StatefulWidget {
  const StateManageWidget({super.key});

  @override
  State<StateManageWidget> createState() => _StateManageWidgetState();
}

class _StateManageWidgetState extends State<StateManageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: TapBoxA(),
        ),
        Expanded(
          child: TapBoxB(),
        ),
        Expanded(
          child: TapBoxC(),
        ),
      ],
    );
  }
}
