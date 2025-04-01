import 'package:flutter/cupertino.dart';

import 'custom_render_box.dart';

class CustomTestWidget extends LeafRenderObjectWidget {

  //RenderObject有2个关键的子类RenderBox和RenderSliver
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomTestRenderBox();
  }


}

class CustomTest2Widget extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomTestRenderBox();
  }

}

class CustomTest3Widget extends MultiChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomTestRenderBox();
  }

}