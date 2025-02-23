import 'package:flutteruitest/layout/tool/student_get_x_controller.dart';
import 'package:get/get.dart';

class StudentGetXBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentGetXController());
  }

}
