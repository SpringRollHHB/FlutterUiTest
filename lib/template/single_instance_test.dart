//懒加载，首次使用的时候初始化，保证运行期间全局唯一
class SingleInstanceTest {
  //保证静态，且只会初始化一次
  static final SingleInstanceTest _instance = SingleInstanceTest._internal();

  //私有化构造器
  SingleInstanceTest._internal();

  //工厂构造函数，对外提供获得对象的接口,始终返回 `_instance`，保证全局唯一
  factory SingleInstanceTest() => _instance;

}

//带参数的单例模式，用的不多 重在理解
class SingleInstance {
  String name;
  static SingleInstance? _instance;

  SingleInstance._internal(this.name);

  factory SingleInstance(String name) {
    if(_instance == null) {
      _instance = SingleInstance._internal(name);
    } else {
      _instance!.name = name;
    }
   return _instance!;
  }
}