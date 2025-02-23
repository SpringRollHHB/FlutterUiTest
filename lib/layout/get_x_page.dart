import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/get_x_status_manager_one.dart';
import 'package:flutteruitest/layout/tool/count_get_controller.dart';
import 'package:flutteruitest/layout/widget/route/route_manage_widget.dart';
import 'package:flutteruitest/utils/get_x_utils.dart';
import 'package:get/get.dart';

import 'get_x_count_page.dart';

class GetXPage extends StatefulWidget {
  const GetXPage({super.key});

  @override
  State<GetXPage> createState() => _GetXPageState();
}

class _GetXPageState extends State<GetXPage> {

  CountGetController countGetController = Get.find<CountGetController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 5,),
            GestureDetector(
              onTap: () => GetXUtils.showDefaultDialog(),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const Text(
                  "GetX-Default-Dialog-无用",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => GetXUtils.showSnackBar(),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const Text(
                  "GetX-SnackBar-无用",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => GetXUtils.showBottomSheet(),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const Text(
                  "GetX-Bottom-Sheet-很好用",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "路由管理",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => RouteManageWidget(backColor: Colors.white,itemBackColor: Colors.black, fontColor: Colors.white,fontSize: 16)));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const Text(
                  "GetX-路由传值",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "状态管理",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(GetXStatusManagerOnePage.name);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const Text(
                  "GetX-响应式状态管理",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(GetXCountPage.name);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Obx(() => Text(
                  "GetX-多页面状态管理-${countGetController.count}-${countGetController.name}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
