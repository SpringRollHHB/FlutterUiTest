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
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(message,style: const TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }

  Future<void> initData() async {
    List<InternetAddress> list = await InternetAddress.lookup("127.0.0.1");
    rawDatagramSocket = await RawDatagramSocket.bind(list.first, 3465);
    rawDatagramSocket?.listen((event) async {
      Datagram? data = rawDatagramSocket?.receive();
      print("UdpReceiveWidget  event->$event data->$data");
    });
  }


}
