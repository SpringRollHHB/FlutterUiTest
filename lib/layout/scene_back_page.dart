import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/scene_back_widget.dart';
import 'package:flutteruitest/layout/widget/scene_clip_path.dart';

class SceneBackPage extends StatefulWidget {
  const SceneBackPage({super.key});

  @override
  State<SceneBackPage> createState() => _SceneBackPageState();
}

class _SceneBackPageState extends State<SceneBackPage> {
  WidgetInfo? widgetInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SceneBackWidget(
            widgetsInfos: (info) {
              widgetInfo = info;
              setState(() {});
            },
          ),
          getClipBarrierArea(),
        ],
      ),
    );
  }

  Widget getClipBarrierArea() {
    if(widgetInfo == null) {
      return const SizedBox.shrink();
    } else {
      return Positioned.fill(
        child: GestureDetector(
          onTap: () {
            setState(() {
              widgetInfo = null;
            });
          },
          child: ClipPath(
            clipper: SceneClipPath(widgetInfo: widgetInfo!),
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
      );
    }
  }

}
