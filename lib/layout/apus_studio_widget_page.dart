import 'package:flutter/material.dart';
import 'package:flutteruitest/layout/widget/apus_fit_auto_size_text.dart';
import 'package:flutteruitest/layout/widget/cal_text_height_width_widget.dart';
import 'package:flutteruitest/layout/widget/text_timer_progress_widget.dart';

class ApusStudioWidgetPage extends StatefulWidget {
  const ApusStudioWidgetPage({super.key});

  @override
  State<ApusStudioWidgetPage> createState() => _ApusStudioWidgetPageState();
}

class _ApusStudioWidgetPageState extends State<ApusStudioWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top,),
            TextTimerProgressWidget(),
            const SizedBox(height: 10,),
            const CalTextHeightWidthWidget(),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8)
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              width: 150,
              height: 40,
              child: ApusWrapFitSizeText(
                "自适应文本-自适应文本-自适应文本-自适应文本-自适应文本",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              constraints: const BoxConstraints(maxWidth: 100),
              height: 30,
              color: Colors.red,
              child: const Text(
                "何浩博何浩博何浩博何浩博何浩博何浩博何浩博何浩博何浩博",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
