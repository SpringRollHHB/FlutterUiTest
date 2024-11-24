import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopScopeWidget extends StatefulWidget {
  const PopScopeWidget({super.key});

  @override
  State<PopScopeWidget> createState() => _PopScopeWidgetState();
}

class _PopScopeWidgetState extends State<PopScopeWidget> {

  /*
  * 在 Flutter 3.16 中，WillPopScope 已被弃用，推荐使用 PopScope 来替代。通过 PopScope 组件的定义，我们了解到其工作原理和用法。当 canPop 为 true 时，系统返回手势将正常弹出封闭的 Navigator，并调用 onPopInvoked 方法。如果 canPop 为 false，则返回手势不会从导航器中弹出路由，但仍会触发 onPopInvoked 方法，此时我们可以根据需要进行逻辑判断或插入其他代码。需要注意的是，onPopInvoked 方法会再次被调用，但此时 didPop 为 true。在 onPopInvoked 中，我们应该根据 didPop 的值进行判断并进行相应的处理
  * */
  
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
          } else {
            return;
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
