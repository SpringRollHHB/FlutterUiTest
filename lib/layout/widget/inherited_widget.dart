import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/share_data_child_widget.dart';
import 'package:flutteruitest/layout/widget/share_data_widget.dart';

class InheritedTestWidget extends StatefulWidget {
  const InheritedTestWidget({super.key});

  @override
  State<InheritedTestWidget> createState() => _InheritedTestWidgetState();
}

class _InheritedTestWidgetState extends State<InheritedTestWidget> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: ShareDataWidget(
          data: count,
          dataTwo: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const ShareDataChildWidget(),
              const SizedBox(height: 40,),
              GestureDetector(
                onTap: () {
                  count++;
                  setState(() {

                  });
                },
                child: Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text("加1",style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
