import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/home_page_widget.dart';
import 'package:flutteruitest/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Ui Study',
      home: HomePageWidget(),
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
