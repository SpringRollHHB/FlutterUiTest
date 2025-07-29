
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class UdpSendWidget extends StatefulWidget {
  const UdpSendWidget({super.key});

  @override
  State<UdpSendWidget> createState() => _UdpSendWidgetState();
}

class _UdpSendWidgetState extends State<UdpSendWidget> {

  RawDatagramSocket? rawDatagramSocket;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () => sendMessage(),
        child: Container(
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text("Send-Udp",style: TextStyle(color: Colors.red,fontSize: 20),),
        ),
      ),
    );
  }

  void sendMessage() async {
    rawDatagramSocket ??= await RawDatagramSocket.bind(InternetAddress.anyIPv4, 2356);
    print("UdpSendWidget  send event ....");
    rawDatagramSocket!.send(Uint8List.fromList("测试数据".codeUnits), InternetAddress.loopbackIPv4, 3465);
  }

}


