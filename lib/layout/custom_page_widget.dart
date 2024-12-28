import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPageWidget extends StatefulWidget {
  const CustomPageWidget({super.key});

  @override
  State<CustomPageWidget> createState() => _CustomPageWidgetState();
}

class _CustomPageWidgetState extends State<CustomPageWidget> {

  final _controller = ScrollController();

  final ValueNotifier<double> _opacity = ValueNotifier(0.0);
  final ValueNotifier<double> _paddingValue = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      debugPrint("hhb y -> ${_controller.position.pixels}");
      var tempRatio = (_controller.position.pixels/200).clamp(0.0, 1.0);
      _opacity.value = tempRatio ;
      _paddingValue.value = (_controller.position.pixels-140).clamp(0.0, 60.0);
    });
  }

  @override
  void dispose() {
    _opacity.dispose();
    _paddingValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(children: [
          ValueListenableBuilder(valueListenable: _paddingValue, builder: (BuildContext context, double value, Widget? child) {
            return Padding(padding: EdgeInsets.only(top: value),child: CustomScrollView(
              controller: _controller,
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                    child: Container(
                        color: Colors.red, height: 200, width: double.infinity)),
                SliverPersistentHeader(
                        delegate: MySliverPersistentHeaderDelegate(
                          height: 60,
                          child: Container(
                            color: Colors.blue,
                            child: const Center(
                              child: Text(
                                "北京欢迎你",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        pinned: true,
                      ),
                SliverToBoxAdapter(
                    child: Container(
                        color: Colors.amberAccent,
                        height: 2000,
                        width: double.infinity,
                        child: Column(children: [
                          const SizedBox(height: 100),
                          const Text("1", style: TextStyle(decoration: TextDecoration.none)),
                          const SizedBox(height: 100),
                          const Text("2", style: TextStyle(decoration: TextDecoration.none)),
                          const SizedBox(height: 100),
                          const Text("3", style: TextStyle(decoration: TextDecoration.none)),
                          const Spacer(),
                          Container(color: Colors.red,height: 30),
                          Container(color: Colors.white,height: 30)
                        ],))),
              ],
            ));
          }),
          ValueListenableBuilder(valueListenable: _opacity, builder: (BuildContext context, double value, Widget? child) {
            return buildTopBar(value);
          }),
        ],));
  }
}

Widget buildTopBar(double opacity) {
  return Opacity(opacity: opacity,child: const SizedBox(height: 60,width: double.infinity,child: Center(child: Text("这是一个顶部占位",style: TextStyle(color: Colors.white,fontSize: 25,decoration: TextDecoration.none)))));
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double height;
  final Widget child;

  MySliverPersistentHeaderDelegate({required this.height, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Expanded(child: Container(child: child));
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}
