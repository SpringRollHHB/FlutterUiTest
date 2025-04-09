import 'package:flutter/material.dart';

class ProAnimationWidget extends StatefulWidget {
  final bool dirty;
  const ProAnimationWidget({super.key,required this.dirty});

  @override
  State<ProAnimationWidget> createState() => _ProAnimationWidgetState();
}

class _ProAnimationWidgetState extends State<ProAnimationWidget> with TickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    colorAnimation = ColorTween(begin: Colors.black,end: Colors.red).animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(shape: BoxShape.circle, color: colorAnimation.value),
          alignment: Alignment.center,
          child: const Text(
            "点击",
            style: TextStyle(color: Colors.white,fontSize: 15),
          ),
        );
      },
    );
  }

  @override
  void didUpdateWidget(covariant ProAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("hhb    context->${context.mounted}");
    if(oldWidget.dirty != widget.dirty) {
      if(animationController.isCompleted) animationController.reverse();
      if(animationController.isDismissed) animationController.forward();
    }
  }

}
