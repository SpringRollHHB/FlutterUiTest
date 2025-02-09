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

  static String method7() {

    void changeValue(int value) {
      value = value+1;
    }

    int number = 10;
    changeValue(number);
    return number.toString();
  }

  static String method8() {
    void changeValue(List<String> list) {
      list.add("3");
    }
    List<String> list = ["1","2"];
    changeValue(list);
    return list.toString();
  }

  static String method9() {
    String result = """he's mother say "hello every" i say too "hello two""""";
    return result;
  }

  static String method10() {
    String result = "he's mother say \"hello every\" i say too \"hello two\"";
    return result;
  }

  static String method11() {
    String lambdaOne(String str) => "${str}1";
    return lambdaOne("2");
  }

  static String method12() {

    lambdaTwo(List<String> l) => {
      l.add("lamdda")
    };

    List<String> list = ["1","2"];
    lambdaTwo(list);

    return list.toString();
  }

}