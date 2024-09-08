import 'package:flutter/cupertino.dart';

class CupertinoStyleWidget extends StatelessWidget {
  const CupertinoStyleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("苹果风格的Bar"),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {},
          child: const Text("press"),
        ),
      ),
    );
  }
}
