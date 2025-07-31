import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  static const name = "/StreamPage";
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {

  final futureTask = Future.delayed(const Duration(seconds: 5)).then((v) => 42);
  final streamTask = Stream.periodic(const Duration(seconds: 1),(v) => v);

  final streamController = StreamController();
  final streamControllerBro = StreamController.broadcast(); //广播stream流，可以有多个监听但是没有缓存

  Future<int> getId() async{
    await Future.delayed(const Duration(seconds: 5));
    return 5;
  }

  Stream<int> getIdStream() async* {
    await Future.delayed(const Duration(seconds: 3));
    yield 1;
    await Future.delayed(const Duration(seconds: 2));
    yield 2;
  }


  @override
  void initState() {
    super.initState();
    futureTask.then((v) => debugPrint("futureTask result : $v"));
    // streamTask.listen((event) => debugPrint("StreamTask result : $event"));
    streamControllerBro.stream.listen(
      (event) => debugPrint("广播 -> $event"),
      onDone: () => debugPrint("广播 -> done"),
      onError: (e) => debugPrint("广播 -> error"),
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamController.close();
    streamControllerBro.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.headlineMedium!,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder(
                  stream: streamTask,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    switch(snapshot.connectionState) {

                      case ConnectionState.none:  //stream is null
                        return const Text("NONE -> 没有数据流");
                      case ConnectionState.waiting:
                        return const Text("WAITING -> 等待数据流");
                      case ConnectionState.active:
                        if(snapshot.hasError) {
                          return Text("ACTIVE -> 收到错误信息:${snapshot.error}");
                        } else {
                          return Text("ACTIVE -> 正常数据:${snapshot.data}");
                        }
                      case ConnectionState.done:
                        return const Text("DONE -> 数据流已经关闭了");
                    }
                    return Container();
                  },
                ),
                GestureDetector(
                  onTap: () => streamController.sink.add(10),
                  child: Container(
                    color: Colors.amber,
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: const Text("10"),
                  ),
                ),
                GestureDetector(
                  onTap: () => streamController.sink.add(1),
                  child: Container(
                    color: Colors.amber,
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: const Text("1"),
                  ),
                ),
                GestureDetector(
                  onTap: () => streamController.sink.add("hello"),
                  child: Container(
                    color: Colors.amber,
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: const Text("hello"),
                  ),
                ),
                GestureDetector(
                  onTap: () => streamController.sink.addError("Error"),
                  child: Container(
                    color: Colors.amber,
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: const Text("Error"),
                  ),
                ),
                GestureDetector(
                  onTap: () => streamController.sink.close(),
                  child: Container(
                    color: Colors.amber,
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: const Text("Close"),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(color: Colors.red,fontSize: 12),
                  child: StreamBuilder(
                    stream: streamController.stream.map((v) {
                      if(v == 1) return 2;
                      return v;
                    }).where((v) => true).distinct(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      switch(snapshot.connectionState) {

                        case ConnectionState.none:  //stream is null
                          return const Text("NONE -> 没有数据流");
                        case ConnectionState.waiting:
                          return const Text("WAITING -> 等待数据流");
                        case ConnectionState.active:
                          if(snapshot.hasError) {
                            return Text("ACTIVE -> 收到错误信息:${snapshot.error}");
                          } else {
                            return Text("ACTIVE -> 正常数据:${snapshot.data}");
                          }
                        case ConnectionState.done:
                          return const Text("DONE -> 数据流已经关闭了");
                      }
                      return Container();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
