import 'package:flutteruitest/layout/tool/student_get_x_controller.dart';
import 'package:get/get.dart';

import 'count_get_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(CountGetController());
    Get.lazyPut(() => CountGetController());
  }

}