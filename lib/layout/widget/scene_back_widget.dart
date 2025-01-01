import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/scene_back_child_inner_widget.dart';

class SceneBackWidget extends StatefulWidget {
  final Function(WidgetInfo) widgetsInfos;

  const SceneBackWidget({super.key, required this.widgetsInfos});

  @override
  State<SceneBackWidget> createState() => _SceneBackWidgetState();
}

class _SceneBackWidgetState extends State<SceneBackWidget> {
  int count = 4;
  late GlobalKey _globalKey;
  final GlobalKey _test1 = GlobalKey();
  final GlobalKey _test2 = GlobalKey();
  final GlobalKey _test3 = GlobalKey();
  final GlobalKey _test4 = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top,),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _selectKey(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800,height: 1.0,),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 100,
            child: Container(
              key: _test1,
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
              alignment: Alignment.center,
              child: const Text(
                "test1",
                style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700,height: 1.0),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 200,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 100,
                itemBuilder: (context,index) {
                  return index == 10
                      ? Container(
                          key: _test2,
                          width: 30,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          child: Text(
                            "$index",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              height: 1.0,
                            ),
                          ),
                        )
                      : Container(
                          width: 30,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          child: Text(
                            "$index",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              height: 1.0,
                            ),
                          ),
                        );
                },
              ),
            ),
          ),
          Center(
            child: SceneBackChildInnerWidget(testKey: _test3,),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
              key: _test4,
              margin: const EdgeInsets.all(20),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
              alignment: Alignment.center,
              child: const Text(
                "test4",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 1.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void getPositionAndSize() {
    GlobalKey key = _globalKey;
    final RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);
    Size size = renderBox.size;
    WidgetInfo widgetInfo = WidgetInfo(
      widgetOffset: position,
      widgetSize: size,
    );
    widget.widgetsInfos.call(widgetInfo);
  }

  void _selectKey(int index) {
    switch(index) {
      case 0 : {
        _globalKey = _test1;
        break;
      }
      case 1 : {
        _globalKey = _test2;
        break;
      }
      case 2 : {
        _globalKey = _test3;
        break;
      }
      case 3 : {
        _globalKey = _test4;
        break;
      }
    }

    if(mounted) {
      getPositionAndSize();
    }
  }


}


class WidgetInfo {
  Offset widgetOffset;
  Size widgetSize;
  WidgetInfo({required this.widgetOffset,required this.widgetSize});
}
