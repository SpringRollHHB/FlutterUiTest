import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animated_list_widget.dart';

class AnimatedListTwoWidget extends StatefulWidget {
  const AnimatedListTwoWidget({super.key});

  @override
  State<AnimatedListTwoWidget> createState() => _AnimatedListTwoWidgetState();
}

class _AnimatedListTwoWidgetState extends State<AnimatedListTwoWidget> {

  var data = ["1","2"];
  int count = 2;
  final GlobalKey<AnimatedListState> globalKey = GlobalKey<AnimatedListState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 250,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: AnimatedList(
              key: globalKey,
              primary: false,
              initialItemCount: data.length,
              itemBuilder:(BuildContext context, int index, Animation<double> ani) {
                var animation = Tween<Offset>(begin: const Offset(1.0,0),end: const Offset(0.0,0.0)).animate(ani);
                return SlideTransition(
                  position: animation,
                  child: buildItem(index),
                );
              },
            ),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: () => addAction(),
            child: Container(
              alignment: Alignment.center,
              width: 110,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: const Text(
                "添加",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addAction() {
    count++;
    data.add(count.toString());
    globalKey.currentState?.insertItem(data.length - 1,duration: const Duration(seconds: 2));
  }

  void removeAction(int index) {
    globalKey.currentState?.removeItem(index, (context, ani) {
      var animation = Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(ani);
      var i = buildItem(index);
      data.removeAt(index);
      return SlideTransition(
        position: animation,
        child: i,
      );
    }, duration: const Duration(seconds: 2));
  }

  Widget buildItem(int index) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 10,),
            Text(
              data[index],
              style: const TextStyle(color: Colors.black,fontSize: 15),
            ),
            const SizedBox(width: 50,),
            GestureDetector(
              onTap: () => removeAction(index),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: const Text("删除",style: TextStyle(color: Colors.white,fontSize: 15),),
              ),
            ),
            const SizedBox(width: 5,),
          ],
        ),
      ),
    );
  }
}
