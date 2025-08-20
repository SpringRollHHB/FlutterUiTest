import 'dart:io';
import 'dart:isolate';

void main() {
  print("isolate start");
  print("isolate current thread : ${Isolate.current.debugName}");
  Isolate.spawn(newThread, "hhb");

  print("isolate end");
}

void newThread(String desc) {
  print("newThread desc:$desc");
  print("newThread isolate current thread : ${Isolate.current.debugName}");
}

