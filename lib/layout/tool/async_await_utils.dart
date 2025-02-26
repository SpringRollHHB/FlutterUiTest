import 'dart:async';

class AsyncAwaitUtils {

  static Future<bool> getBoolValueNoAsync() {
    Completer<bool> completer = Completer<bool>();

    Future.delayed(const Duration(seconds: 5)).then((value) {
      completer.complete(true);
    }).catchError((_) {
      completer.complete(false);
    });

    return completer.future;
  }

  static Future<bool> getBoolValueWithAsync() async {
    await Future.delayed(const Duration(seconds: 5));
    return true;
  }


}