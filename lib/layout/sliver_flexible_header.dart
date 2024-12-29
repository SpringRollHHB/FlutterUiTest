import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class SliverFlexibleHeader extends SingleChildRenderObjectWidget {
  final double visibleExtent;

  const SliverFlexibleHeader({super.key,required this.visibleExtent});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return  FlexibleHeaderRenderSliver(visibleExtent);
  }

  @override
  void updateRenderObject(BuildContext context, FlexibleHeaderRenderSliver renderObject) {
    renderObject.visibleExtent = visibleExtent;
  }

}

class FlexibleHeaderRenderSliver extends RenderSliverSingleBoxAdapter {
  FlexibleHeaderRenderSliver(double visibleExtent) : _visibleExtent = visibleExtent;

  late double _visibleExtent;
  double _lastOverScroll = 0;
  double _lastScrollOffset = 0;

  set visibleExtent(double value) {
    if (_visibleExtent != value) {
      _lastOverScroll = 0;
      _visibleExtent = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    // TODO: implement performLayout
  }

}