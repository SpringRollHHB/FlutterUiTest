import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UdpReceiveWidget extends StatefulWidget {
  const UdpReceiveWidget({super.key});

  @override
  State<UdpReceiveWidget> createState() => _UdpReceiveWidgetState();
}

class _UdpReceiveWidgetState extends State<UdpReceiveWidget> {

  RawDatagramSocket? rawDatagramSocket;
  String message = "Receive-Udp";

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(message,style: const TextStyle(color: Colors.white,fontSize: 20),),
    );
  }

  Future<void> initData() async {
    rawDatagramSocket = await RawDatagramSocket.bind(InternetAddress.loopbackIPv4, 3465);
    rawDatagramSocket?.listen((event) async {
      Datagram? data;
      switch(event) {
        case RawSocketEvent.read: {
          data = rawDatagramSocket?.receive();
          //test event -> RawSocketEvent.closed
          Future.delayed(const Duration(seconds: 2)).then((v) {
            rawDatagramSocket?.close();
            rawDatagramSocket = null;
          });
        }
        case RawSocketEvent.write: { } //通常只会在 socket 启动时触发一次
        case RawSocketEvent.closed: { rawDatagramSocket?.close(); }
        case RawSocketEvent.readClosed: {}
      }
      print("UdpReceiveWidget  event->$event data->${data != null ? utf8.decode(data.data) : "null"}");
      data = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    rawDatagramSocket?.close();
    rawDatagramSocket = null;
  }


}
