


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';

class ApusWrapFitSizeText extends StatefulWidget {
  final String? data;
  final double minFontSize;
  final double maxFontSize;
  final double stepGranularity;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? style;
  final TextOverflow? overflow;

  final TextSpan? textSpan;

  ApusWrapFitSizeText(String this.data,
      {super.key,
        this.style,
        this.minFontSize = 12,
        this.maxFontSize = double.infinity,
        this.stepGranularity = 1,
        this.overflow,
        this.textAlign,
        this.maxLines,
      }):textSpan = null;

  const ApusWrapFitSizeText.rich(
      TextSpan this.textSpan, {
        Key? key,
        this.style,
        this.minFontSize = 12,
        this.maxFontSize = double.infinity,
        this.stepGranularity = 1,
        this.textAlign,
        this.overflow,
        this.maxLines,
      })  : data = null,
        super(key: key);



  @override
  State<StatefulWidget> createState() => _ApusWrapFitSizeTextState();
}

class _ApusWrapFitSizeTextState extends State<ApusWrapFitSizeText> {
  @override
  Widget build(BuildContext context) {

    // HealthLogger.logI('before adjust max:${widget.maxFontSize},min:${widget.minFontSize},step:${widget.stepGranularity}');
    var maxValue = widget.maxFontSize;
    if (widget.maxFontSize != double.infinity) {
      maxValue = widget.maxFontSize.round().toInt().toDouble();
    }

    var minValue = widget.minFontSize.round().toInt().toDouble();

    var stepGranularity = widget.stepGranularity.round().toInt().toDouble();
    var resultMax = maxValue / stepGranularity % 1;
    var resultMin = minValue / stepGranularity % 1;
    // HealthLogger.logI('after adjust max:$maxValue,min:$minValue,resultMax:$resultMax,resultMin:$resultMin,stepGranularity:$stepGranularity');

    if (widget.data == null && widget.textSpan != null) {
      return AutoSizeText.rich(
        widget.textSpan!,
        maxFontSize: maxValue,
        minFontSize: minValue,
        stepGranularity: stepGranularity,
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        overflow: widget.overflow,
        style: widget.style,
      );
    }


    return AutoSizeText(widget.data ?? "",
      maxFontSize: maxValue,
      minFontSize: minValue,
      stepGranularity: stepGranularity,
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      style: widget.style,
    );
  }
}