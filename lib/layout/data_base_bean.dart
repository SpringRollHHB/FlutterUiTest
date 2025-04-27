import 'package:get/get.dart';

class PersonGetX {
  RxInt age = 10.obs;
  RxString name = "变形金刚".obs;
}

class StudentGetX {
  String name;
  int age;

  StudentGetX({required this.name, required this.age});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true; // 如果是同一个对象，直接返回 true
    return other is StudentGetX && other.name == name && other.age == age;
  }

  @override
  int get hashCode => Object.hash(name, age); // 使用 name 和 age 的哈希值组合生成哈希码
}