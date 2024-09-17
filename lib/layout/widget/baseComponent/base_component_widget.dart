import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseComponentWidget extends StatefulWidget {
  const BaseComponentWidget({super.key});

  @override
  State<BaseComponentWidget> createState() => _BaseComponentWidgetState();
}

class _BaseComponentWidgetState extends State<BaseComponentWidget> {

  bool _switchOn = false;
  List<bool> _checkboxOns = [false,false,false];
  String _radioValue = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const DefaultTextStyle(
                style: TextStyle(color: Colors.amber, fontSize: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(textAlign: TextAlign.center, "你好"),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        "你好",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        "你好",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          inherit: false,
                        ),
                      ),
                    ),
                  ],
                ),),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: const Text(
                        "高度测试",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          height: 40 / 15,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],),
              ),
              Row(children: [
                Expanded(child: OutlinedButton(onPressed: () {}, child: const Text("OutlinedButton"),),),
                Expanded(child: IconButton(onPressed: () {}, icon: Image.asset("images/image_car_1.png",height: 10,width: 10,),),),
              ],),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [   //字体图标
                  Icon(Icons.add_alarm, color: Colors.red,),
                  Icon(Icons.abc, color: Colors.green,),
                  Icon(Icons.ac_unit_outlined, color: Colors.amber,),
                  Icon(Icons.ac_unit_rounded, color: Colors.red,),
                ],
              ),
              Switch(value: _switchOn, onChanged: (value) {
                setState(() {
                  _switchOn = value;
                });
              }),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _checkboxOns.asMap().entries.map((entry) => SizedBox(width: 100,child: CheckboxListTile(controlAffinity: ListTileControlAffinity.leading,value: entry.value, activeColor: Colors.red, title: Text("${entry.key + 1}",style: TextStyle(color: Colors.green),), onChanged: (value) {
                  setState(() {
                    _checkboxOns[entry.key] = value ?? false;
                  });
                },),),).toList(),),
              Container(height: 100,alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 100,child: RadioListTile(
                      value: "1",
                      title: const Text(
                        "1",
                        style: TextStyle(color: Colors.green),
                      ),
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value ?? "1";
                        });
                      },
                    ),),
                    SizedBox(width: 100,child: RadioListTile(
                      value: "2",
                      title: const Text(
                        "2",
                        style: TextStyle(color: Colors.green),
                      ),
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value ?? "1";
                        });
                      },
                    ),),
                    SizedBox(width: 100,child: RadioListTile(
                      value: "3",
                      title: const Text(
                        "3",
                        style: TextStyle(color: Colors.green),
                      ),
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value ?? "1";
                        });
                      },
                    ),),
                  ],
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
