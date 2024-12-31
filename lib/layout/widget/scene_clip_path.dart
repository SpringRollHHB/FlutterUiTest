import 'package:flutter/cupertino.dart';
import 'package:flutteruitest/layout/widget/scene_back_widget.dart';

class SceneClipPath extends CustomClipper<Path> {

  final WidgetInfo widgetInfo;
  SceneClipPath({required this.widgetInfo});


  @override
  Path getClip(Size size) {
    Path path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    Path innerPath = Path();
    innerPath.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(widgetInfo.widgetOffset.dx - 5, widgetInfo.widgetOffset.dy - 5, widgetInfo.widgetSize.width + 10, widgetInfo.widgetSize.height + 10),
        const Radius.circular(10),
      ),
    );
    path = Path.combine(PathOperation.difference, path, innerPath);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}