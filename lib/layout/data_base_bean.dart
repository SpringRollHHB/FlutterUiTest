import 'package:get/get.dart';

class PersonGetX {
  RxInt age = 10.obs;
  RxString name = "变形金刚".obs;
}

class StudentGetX {
  String name;
  int age;
  StudentGetX({required this.name,required this.age});
}