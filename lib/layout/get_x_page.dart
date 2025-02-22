import 'package:flutter/material.dart';
import 'package:flutteruitest/utils/get_x_utils.dart';

class GetXPage extends StatefulWidget {
  const GetXPage({super.key});

  @override
  State<GetXPage> createState() => _GetXPageState();
}

class _GetXPageState extends State<GetXPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top,),
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
                  "GetX-default-dialog",
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
                  "GetX-snackbar",
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
                  "GetX-bottom-sheet-很好用",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
