import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/home_page_widget.dart';
import 'package:flutteruitest/player.dart';
import 'layout/widget/route/no_name_result_widget.dart';

void main() {
  var oldError = FlutterError.onError;
  FlutterError.onError = (details) {
    oldError?.call(details);
    //这里统一处理flutter为我们捕获的异常
  };
  runZoned(
    () => runApp(const MyApp()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        //拦截print事件
        parent.print(zone, line);
      },
      handleUncaughtError: (Zone self, ZoneDelegate parent, Zone zone, Object error, StackTrace stackTrace) {
        //拦截未处理的error
        parent.print(zone, error.toString());
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ui Study',
      initialRoute: '/',
      routes: {
        "/" : (context) => const HomePageWidget(),
        NoNameResultWidget.name: (context) => NoNameResultWidget(showTitle: ModalRoute.of(context)?.settings.arguments as String),
      },
      onGenerateRoute: (settings) {   //钩子
          return MaterialPageRoute(builder: (context) {
            return Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Text(
              settings.arguments as String,
              style: const TextStyle(
                color: Colors.red,
                decoration: TextDecoration.none,
                fontSize: 30,
              ),
            ),
          );
          });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: (){
              // 跳转到player
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Player(url:'https://www.w3schools.com/html/movie.mp4')));
            }, child: const Text('视频播放1')),
            TextButton(onPressed: (){
              // 跳转到player
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Player(url:'https://file.picku.cloud/40b977df/banner/ff01a42e9e59c244e824e4754a7f7d10.mp4')));
            }, child: const Text('视频播放2')),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
