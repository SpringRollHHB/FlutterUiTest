import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({super.key});

  @override
  State<AnimatedListWidget> createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {

  int count = 1;

  final globalKey = GlobalKey<CustomAnimatedListState>();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          color: Colors.amber,
          height: 300,
          width: double.infinity,
          child: CustomAnimatedList(
            key: globalKey,
            initialItemCount: count,
            itemBuilder: (ctx, index, animation) {
              debugPrint("AnimatedListWidget animation:${animation.value}");
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: _buildItem(index),
                ),
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () => _addItem(),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5)
            ),
            height: 50,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10,left: 15,right: 15),
            alignment: Alignment.center,
            child: const Text(
              "添加",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
              ),
            ),
          ),
        )
      ],
    );

  }

  Widget _buildItem(int index) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            "$index",
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => _removeItem(index),
            child: Container(
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              height: double.infinity,
              width: 50,
              margin: const EdgeInsets.all(2),
              alignment: Alignment.center,
              child: const Text(
                "删除",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  void _addItem() {
    count++;
    debugPrint("hhb is null ${globalKey.currentState == null}");
    globalKey.currentState?.insertItem(count - 1);
  }

  void _removeItem(int index) {
    globalKey.currentState?.removeItem(
      index,
      (context, animation) {
        var item = _buildItem(index);
        count--;
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: item,
          ),
        );
      },
    );
  }


}

class CustomAnimatedList extends AnimatedList {
  const CustomAnimatedList({super.key, required super.itemBuilder, required super.initialItemCount});
  @override
  CustomAnimatedListState createState() => CustomAnimatedListState();
}

class CustomAnimatedListState extends AnimatedListState {

  @override
  void insertItem(int index, {Duration duration = const Duration(milliseconds: 500)}) {
    super.insertItem(index, duration: const Duration(milliseconds: 5000));
  }

  @override
  void removeItem(int index, AnimatedRemovedItemBuilder builder, {Duration duration = const Duration(milliseconds: 500)}) {
    super.removeItem(index, builder, duration: const Duration(milliseconds: 3000));
  }

}



