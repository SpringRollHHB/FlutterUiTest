class BasicSyntaxUtils {

  static String method1() {
    var list1 = ["1","2"];
    var list2 = ["3","4","5"];
    var list = ["A",...list1,"B",...list2];
    return list.toString();
  }

  static String method2() {
    var list1;
    var list2 = ["a","b","c"];
    var list = ["1",...list2,...?list1];
    return list.toString();
  }

  static String method3() {
    var list = [
      "1","2",if(true) "3",if(false) "4","5"
    ];
    return list.toString();
  }

  static String method4() {
    var list = [
      for (int i = 0; i < 3; i++) {
        "index-$i"
      }
    ];
    return list.toString();
  }

  static String method5() {
    var set = {
      "a","b","c","d","e","f",if(false) "g",if(true) "h",for (int i = 0; i < 3; i++) { "index-$i"}
    };
    return set.toString();
  }

  static String method6() {
    Set set = <String>{};
    set.add("1");
    set.add("1");
    set.add("2");
    set.add("3");
    set.add("4");
    return set.toString();
  }

}