import 'dart:async';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteruitest/layout/tool/all_controller_binding.dart';
import 'package:flutteruitest/routers.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/home_page_widget.dart';
import 'package:flutteruitest/layout/widget/single_ton.dart';
import 'package:flutteruitest/player.dart';
import 'channel/FlutterAndroidChannel.dart';
import 'layout/get_x_route_one.dart';
import 'layout/tool/count_get_controller.dart';
import 'layout/widget/route/no_name_result_widget.dart';

void main() async{
  var oldError = FlutterError.onError;
  FlutterError.onError = (details) {
    oldError?.call(details);
    //这里统一处理flutter为我们捕获的异常
  };
  WidgetsFlutterBinding.ensureInitialized();
  FlutterToAndroid.init();
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
    SingleTon.singleTon;
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      builder: (BuildContext context, Widget? child,) {
        return GetMaterialApp(
          title: 'Flutter Ui Study',
          initialBinding: AllControllerBinding(),
          initialRoute: "/",
          defaultTransition: Transition.leftToRight, //默认路由动画
          // routes: {
          //   "/" : (context) => const HomePageWidget(),
          //   NoNameResultWidget.name: (context) {
          //     debugPrint("NoNameResultWidget.name...routes");
          //     return NoNameResultWidget(showTitle: ModalRoute.of(context)?.settings.arguments as String);
          //   },
          // },
          // onGenerateRoute: (settings) {   //钩子-中间件
          //     return MaterialPageRoute(builder: (context) {
          //       return Container(
          //       width: double.infinity,
          //       height: double.infinity,
          //       alignment: Alignment.center,
          //       child: Text(
          //         settings.arguments as String,
          //         style: const TextStyle(
          //           color: Colors.red,
          //           decoration: TextDecoration.none,
          //           fontSize: 30,
          //         ),
          //       ),
          //     );
          //     });
          // },
          getPages: RouterPages.routers,
        );
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
