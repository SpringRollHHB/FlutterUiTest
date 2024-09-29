import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopScopeWidget extends StatefulWidget {
  const PopScopeWidget({super.key});

  @override
  State<PopScopeWidget> createState() => _PopScopeWidgetState();
}

class _PopScopeWidgetState extends State<PopScopeWidget> {
  
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  int lastTime = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          // didPop为false表示屏蔽了物理返回按键或者右滑退出手势
          // didPop为true表示页面已经正常退出
          debugPrint("PopScopeWidget is empty:${textEditingController.text.isEmpty} didPop:$didPop");
          if(!didPop) {
            if(lastTime == 0) {
              lastTime = DateTime.now().second;
            } else {
              int now = DateTime.now().second;
              if((now - lastTime) < 2) {
                Navigator.of(context).pop();
              } else {
                lastTime = now;
              }
            }
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  focusNode.requestFocus();
                },
                child: Container(
                  color: Colors.green,
                  child: EditableText(
                    controller: textEditingController,
                    focusNode: focusNode,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red,fontSize: 35),
                    cursorColor: Colors.black,
                    backgroundCursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    autofocus: true,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text("退出",style: TextStyle(color: Colors.black,fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  
}
