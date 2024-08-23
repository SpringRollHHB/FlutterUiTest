import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/*
* GridView : 网格布局
*   1.gridDelegate: 控制GridView子组件如何排列(layout) 具体实现-> SliverGridDelegateWithFixedCrossAxisCount | SliverGridDelegateWithMaxCrossAxisExtent
*   2.cross axis 指的是与主轴（滑动）方向垂直的方向
* */

class GridViewPageWidget extends StatefulWidget {
  const GridViewPageWidget({super.key});

  @override
  State<GridViewPageWidget> createState() => _GridViewPageWidgetState();
}

class _GridViewPageWidgetState extends State<GridViewPageWidget> {
  List<String> iconList = [];

  @override
  void initState() {
    _loadIcons();
    super.initState();
  }

  void _loadIcons() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
        iconList.addAll(
          [
            "images/image_car_1.png",
            "images/image_car_2.png",
            "images/image_car_3.png",
            "images/image_car_4.png",
            "images/image_car_5.png",
            "images/image_car_6.png",
            "images/image_car_7.png",
            "images/image_car_8.png",
            "images/image_car_9.png",
          ]
        );
        setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.0,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            children: <Widget>[
              Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    "images/image_car_1.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    "images/image_car_2.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    "images/image_car_3.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    "images/image_car_4.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    "images/image_car_5.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    "images/image_car_6.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    "images/image_car_7.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    "images/image_car_8.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    "images/image_car_9.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 2,crossAxisSpacing: 5,mainAxisSpacing: 5),
            itemBuilder: (BuildContext context, int index) {
              if(index == iconList.length -1 && index < 200) {
                _loadIcons();
              }
              return Container(color: Colors.blue,child: Center(child: Image.asset(iconList[index],height: 30,width: 30,),),);
            },
            itemCount: iconList.length,
          ),
        ),
      ],
    );
  }


}
