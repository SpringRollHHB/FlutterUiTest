import 'common_tools.dart';

class LogTools {
  static bool DEBUG = true;
  static void logI(String str) {
    if(DEBUG) {
      var time = getFormatTimeByDateTime(DateTime.now(), "yyyy-MM-dd HH:mm:ss.SSS");
      print("$time TAG:health link----$str");
    }
  }
}