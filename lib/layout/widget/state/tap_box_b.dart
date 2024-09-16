import 'package:flutter/material.dart';

class TapBoxB extends StatefulWidget {
  const TapBoxB({super.key});

  @override
  State<TapBoxB> createState() => _TapBoxBState();
}

class _TapBoxBState extends State<TapBoxB> {
  bool _active = false;

  void changeChildState(bool value) {
    setState(() {
      _active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxBB(
      active: _active,
      action: changeChildState,
    );
  }

}

class TapBoxBB extends StatelessWidget {

  final bool active;
  final Function(bool) action;

  const TapBoxBB({super.key, required this.active, required this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action.call(!active),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          "父widget管理子widget的state",
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
