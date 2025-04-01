import 'package:flutter/rendering.dart';

class CustomTestRenderBox extends RenderBox {

  @override
  bool hitTestSelf(Offset position) {
    return true;
  }
  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    return super.hitTest(result, position: position);
  }


  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return super.hitTestChildren(result, position: position);
  }

  @override
  void handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) {
    super.handleEvent(event, entry);
    size = constraints.constrain(const Size(100, 100));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
  }

  @override
  void performLayout() {
    super.performLayout();
  }


}