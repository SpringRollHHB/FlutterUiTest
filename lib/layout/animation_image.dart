import 'package:flutter/cupertino.dart';

class AnimationImage extends AnimatedWidget {

  const AnimationImage({required super.listenable});

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Image.asset(
        "images/caocao.webp",
        height: animation.value,
        width: animation.value,
      ),
    );
  }
  
}
