import 'package:flutter/material.dart';
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
          ],
        ),
      ),
    );
  }
}
