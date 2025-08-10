import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyTestPage extends StatefulWidget {
  static const name = "/KeyTestPage";
  const KeyTestPage({super.key});

  @override
  State<KeyTestPage> createState() => _KeyTestPageState();
}

class _KeyTestPageState extends State<KeyTestPage> {

  List<Box> boxList = [
    Box(key: UniqueKey(), backColor: Colors.red),
    Box(key: UniqueKey(), backColor: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top,),
                    const Box(key: ValueKey("3"),backColor: Colors.blue),
                    const Box(key: ValueKey("1"),backColor: Colors.white),
                    const Box(key: ValueKey("2"),backColor: Colors.amber),
                  ],
                ),
                const SizedBox(width: 10,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top,),
                    ...boxList,
                    GestureDetector(
                      onTap: () {
                        Box box  = boxList.removeLast();
                        boxList.insert(0, box);
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 50,
                        color: Colors.amber,
                        alignment: Alignment.center,
                        child: const Text("点击",style: const TextStyle(color: Colors.black),),
                      ),
                    )
                  ],
                )
              ],
            )
        ],
      ),
    );
  }

}

class Box extends StatefulWidget {
  final Color backColor;
  //{super.key}
  const Box({required Key key,required this.backColor}) : super(key: key);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _count++;
        });
      },
      child: Container(
        width: 60,
        height: 50,
        color: widget.backColor,
        alignment: Alignment.center,
        child: Text("$_count",style: const TextStyle(color: Colors.black),),
      ),
    );
  }
}

