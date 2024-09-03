import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Player extends StatefulWidget {
  final String url;

  const Player({super.key, required this.url});
  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  static const platform = MethodChannel('swift/player/channel');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    platform.setMethodCallHandler((call) => _handelCall(call));
    return Scaffold(
      body: _body(),
    );
  }

  Future<void> _handelCall(MethodCall methodCall) async {
    String uri = methodCall.method;
    if(uri == 'close'){
      Navigator.pop(context);
    }
  }
  
  Widget _body() {
    switch (defaultTargetPlatform){
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: 'swift_player',
          creationParams: {"url": widget.url},
          creationParamsCodec: const StandardMessageCodec(),
          layoutDirection: TextDirection.ltr,
        );
      case TargetPlatform.fuchsia:
        // TODO: Handle this case.
        throw UnsupportedError('Unsupported platform view');
      case TargetPlatform.android:
        // TODO: Handle this case.
      case TargetPlatform.linux:
        // TODO: Handle this case.
      case TargetPlatform.macOS:
        // TODO: Handle this case.
      case TargetPlatform.windows:
        // TODO: Handle this case.
    }
    return Container();
  }
}
