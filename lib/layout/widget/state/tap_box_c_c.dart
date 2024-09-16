import 'package:flutter/material.dart';

class TapBoxCC extends StatefulWidget {

  final bool active;
  final Function(bool) actionBack;

  const TapBoxCC({super.key, required this.active, required this.actionBack});

  @override
  State<TapBoxCC> createState() => _TapBoxCCState();
}

class _TapBoxCCState extends State<TapBoxCC> {
  bool showLightLine = false;

  void _show() {
    setState(() {
      showLightLine = true;
    });
  }

  void _notShow() {
    setState(() {
      showLightLine = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {  _show();  },
      onTapCancel: _notShow,
      onTapUp: (details) {  _notShow();  },
      onTap: () { widget.actionBack(!widget.active); },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: showLightLine ? Border.all(color: Colors.white,width: 2) : null,
            color: widget.active ? Colors.red : Colors.green,
            borderRadius: BorderRadius.circular(20)),
        child: const Text(
          "混合管理子widget的state",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}