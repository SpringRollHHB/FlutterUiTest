import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/circle_remove_widget.dart';

class EventHandlingNotificationPage extends StatefulWidget {
  const EventHandlingNotificationPage({super.key});

  @override
  State<EventHandlingNotificationPage> createState() => _EventHandlingNotificationPageState();
}

class _EventHandlingNotificationPageState extends State<EventHandlingNotificationPage> {
  PointerEvent? _pointerEvent;
  double _width = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 10,),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 15,),
                Expanded(
                  child: Builder(
                    builder: (ctx) {
                      return Listener(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          alignment: Alignment.center,
                          height: 200,
                          width: double.infinity,
                          child: Text(
                            "Listener-事件\n相对于容器:${_pointerEvent?.localPosition} \n相对于屏幕:${_pointerEvent?.position}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        onPointerDown: (event) {
                          (ctx as Element).markNeedsBuild();
                          _pointerEvent = event;
                        },
                        onPointerMove: (event) {
                          (ctx as Element).markNeedsBuild();
                          _pointerEvent = event;
                        },
                        onPointerUp: (event) {
                          (ctx as Element).markNeedsBuild();
                          _pointerEvent = event;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(width: 15,),
              ],
            ),
            const SizedBox(height: 15,),
            Listener(
              child: AbsorbPointer(
                child: Listener(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "AbsorbPointer",
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
                    ),
                  ),
                  onPointerDown: (event) => debugPrint("AbsorbPointer down-2"),
                ),
              ),
              onPointerDown: (event) => debugPrint("AbsorbPointer down-1"),
            ),
            Listener(
              child: IgnorePointer(
                child: Listener(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "IgnorePointer",
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
                    ),
                  ),
                  onPointerDown: (event) => debugPrint("IgnorePointer down-2"),
                ),
              ),
              onPointerDown: (event) => debugPrint("IgnorePointer down-1"),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const CircleRemoveWidget(),
            ),
            GestureDetector(
              onTap: () => debugPrint("tapTest -> onTap()"),
              onDoubleTap: () => debugPrint("tapTest -> onDoubleTap()"),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(15)),
                height: 50,
                alignment: Alignment.center,
                child: const Text("onTap测试",style: TextStyle(color: Colors.white,fontSize: 20,height: 1.0),),
              ),
            ),
            StatefulBuilder(builder: (ctx, _setState) {
              return GestureDetector(
                child: Image.asset(
                  "images/guanyu.webp",
                  height: _width,
                  width: _width,
                ),
                onScaleUpdate: (event) {
                  _width = 200 * event.scale;
                  _setState(() {

                  });
                },
              );
            }),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
