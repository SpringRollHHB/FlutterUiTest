import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStateWidget extends StatefulWidget {
  const GetStateWidget({super.key});

  @override
  State<GetStateWidget> createState() => _GetStateWidgetState();
}

class _GetStateWidgetState extends State<GetStateWidget> {
  bool _showSnackBar = true;

  //同一个 GlobalKey 在整个 widget 树中必须是唯一的，不能重复 (你不能在同一个应用中为不通的widget 设置相同的 GlobalKey)
  final GlobalKey<ScaffoldState> _globalScaffoldStateKey  = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalScaffoldStateKey,
      backgroundColor: Colors.black,
      appBar:  AppBar(
        title: const Text("子树中获取State对象"),
      ),
      drawer: const Drawer(),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldState? state =
                        context.findAncestorStateOfType<ScaffoldState>();
                    debugPrint("hhb ${state != null}");
                    if (state != null) {
                      state.openDrawer();
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(13),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    child: const Text(
                      "获取父级widget的state-打开抽屉1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }),
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(13),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    child: const Text(
                      "获取父级widget的state-打开抽屉2",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }),
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    _globalScaffoldStateKey.currentState?.openDrawer();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(13),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    child: const Text(
                      "获取父级widget的state-打开抽屉3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }),
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    if(_showSnackBar) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "我是SnackBar",
                          ),
                        ),
                      );
                      _showSnackBar = false;
                    } else {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _showSnackBar = true;
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(13),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    child: const Text(
                      "获取父级widget的state-显示SnackBar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

}
