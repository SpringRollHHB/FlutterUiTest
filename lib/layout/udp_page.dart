import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/state/udp_receive_widget.dart';
import 'package:flutteruitest/layout/widget/udp_send_widget.dart';

class UdpPage extends StatefulWidget {
  static const name = "/UdpPage";
  const UdpPage({super.key});

  @override
  State<UdpPage> createState() => _UdpPageState();
}

class _UdpPageState extends State<UdpPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/4,
            width: double.infinity,
            child: const UdpSendWidget(),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: MediaQuery.of(context).size.height/4,
            width: double.infinity,
            child: const UdpReceiveWidget(),
          ),
        ],
      ),
    );
  }

}
