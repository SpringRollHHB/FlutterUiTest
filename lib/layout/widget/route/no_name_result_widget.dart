import 'package:flutter/material.dart';

class NoNameResultWidget extends StatelessWidget {
  static const String name = "/NoNameResultWidget";

  final String showTitle;
  const NoNameResultWidget({super.key, required this.showTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop("何浩博");
        },
        child: Text(
          showTitle,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 50,
            fontWeight: FontWeight.w900,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
