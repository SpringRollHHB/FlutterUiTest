import 'dart:async';
import 'package:flutter/material.dart';

class TextTimerProgressWidget extends StatelessWidget {
  TextTimerProgressWidget({super.key});

  String r = "Feel free to ask me~ 😊";
  String showText = "";
  int currentIndex = 0;
  
  String r2 = "Feel free to ask me~";
  String showText2 = "";
  int currentIndex2 = 0;


  String getValidSubstring(String text, int index) {
    List<int> codeUnits = text.runes.toList();

    String result = String.fromCharCodes(codeUnits.sublist(0, index));

    return result;
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(milliseconds: 1000),(timer) {
      if(currentIndex < r.length) {
        currentIndex++;
        showText = getValidSubstring(r, currentIndex);
        (context as Element).markNeedsBuild();
      } else {
        timer.cancel();
      }
    });

    
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10)
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            showText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              height: 1.0,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Timer.periodic(const Duration(milliseconds: 1000),(timer) {
              if(currentIndex2 < r2.length) {
                currentIndex2++;
                showText2 = r2.substring(0,currentIndex2);
                (context as Element).markNeedsBuild();
              } else {
                timer.cancel();
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              showText2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }


}
