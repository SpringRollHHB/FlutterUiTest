import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/show_context_text_widget.dart';

class ContextTestPage extends StatefulWidget {
  static const name = "/ContextTestPage";
  const ContextTestPage({super.key});

  @override
  State<ContextTestPage> createState() => _ContextTestPageState();
}

class _ContextTestPageState extends State<ContextTestPage> {

  ValueNotifier<bool> _showNotify = ValueNotifier(true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              ValueListenableBuilder(
                  valueListenable: _showNotify,
                  builder: (_, show, c) {
                    return Visibility(
                      visible: show,
                      child: Container(
                        height: 80,
                        width: 80,
                        alignment: Alignment.center,
                        color: Colors.yellow,
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ShowContextTestWidget(),
                            Text(
                              "visiable测试",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  _showNotify.value = false;
                },
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
