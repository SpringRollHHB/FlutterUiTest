import 'package:flutter/cupertino.dart';

class StateRecycleTestWidget extends StatefulWidget {
  const StateRecycleTestWidget({super.key});

  @override
  State<StateRecycleTestWidget> createState() => _StateRecycleTestWidgetState();
}

class _StateRecycleTestWidgetState extends State<StateRecycleTestWidget> {

  @override
  void initState() {
    debugPrint("StateRecycleTestWidget  初始化只调用一次");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint("StateRecycleTestWidget  state依赖发生变化的时候会调用"); //例如：系统主题或者语言改变的时候会调用
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void reassemble() {
    debugPrint("StateRecycleTestWidget  调试的时候专用,release的情况下一直不会调用");
    super.reassemble();
  }

  @override
  void didUpdateWidget(covariant StateRecycleTestWidget oldWidget) {
    debugPrint("StateRecycleTestWidget  widget更新的时候调用");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    debugPrint("StateRecycleTestWidget  当 State 对象从树中被移除时，会调用此回调");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("StateRecycleTestWidget  当 State 对象从树中被永久移除时调用；通常在此回调中释放资源");
    super.dispose();
  }

}
