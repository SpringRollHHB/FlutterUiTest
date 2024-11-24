import 'package:flutter/cupertino.dart';

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({super.key, required super.child,required this.data,required this.dataTwo});

  final int data;
  final int dataTwo;

  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    debugPrint("ShareDataWidget  old:${oldWidget.data}  newData:$data");
    return oldWidget.data != data || oldWidget.dataTwo != dataTwo;
  }

}
