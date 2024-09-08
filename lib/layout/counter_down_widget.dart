import 'package:flutter/material.dart';

class CounterDownWidget extends StatefulWidget {
  const CounterDownWidget({super.key});

  @override
  State<CounterDownWidget> createState() => _CounterDownWidgetState();
}

class _CounterDownWidgetState extends State<CounterDownWidget> {
  int counterNumber = 0;

  @override
  void initState() {
    super.initState();
    debugPrint("CounterDownWidget  initState....");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("CounterDownWidget  build......");
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "$counterNumber",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 80,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  counterNumber++;
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
                  height: 50,
                  margin: const EdgeInsets.only(
                    bottom: 30,
                    left: 10,
                    right: 10,
                  ),
                  child: const Text(
                    "增加",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
