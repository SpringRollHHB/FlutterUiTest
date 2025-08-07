void main() {
  print("1");
  test1();
  print("2");
}

Future<void> test1() async {
  print("hhb 11111");
  await Future.delayed(const Duration(seconds: 2));
  print("hhb 2222");
}