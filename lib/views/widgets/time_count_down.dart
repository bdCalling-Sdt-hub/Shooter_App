
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeCountDown extends StatefulWidget {
  final Color? textColor;
  final DateTime dateLine;
  final double? textSize;
  const TimeCountDown({super.key, required this.dateLine, this.textColor = Colors.black, this.textSize = 12});

  @override
  State<TimeCountDown> createState() => _TimeCountDownState();
}

class _TimeCountDownState extends State<TimeCountDown> {

  late Timer timer;
  Duration duration = Duration();


  @override
  void initState() {
    CalculateTimeLeft(widget.dateLine);
    timer = Timer.periodic(Duration(seconds: 1), (_) => CalculateTimeLeft(widget.dateLine) );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = DefaultTextStyle(style:  TextStyle(color: widget.textColor,fontSize: widget.textSize?.h), child: Text('${duration.inDays.toString().padLeft(2,'0')}d :'));
    final hours = DefaultTextStyle(style:  TextStyle(color: widget.textColor,fontSize: widget.textSize?.h), child: Text('${duration.inHours.toString().padLeft(2,'0')}h :'));
    final minutes = DefaultTextStyle(style:  TextStyle(color: widget.textColor, fontSize: widget.textSize?.h), child: Text('${duration.inMinutes.remainder(60).toString().padLeft(2,'0')}m :'));
    final seconds = DefaultTextStyle(style:  TextStyle(color: widget.textColor, fontSize: widget.textSize?.h), child: Text('${duration.inSeconds.remainder(60).toString().padLeft(2,'0')}s'));
    return Row(
      children: [
        days,
        hours,
        minutes,
        seconds
      ],
    );
  }

  void CalculateTimeLeft(DateTime dateLine) {
    final secound = dateLine.difference(DateTime.now()).inSeconds;
    setState(() => duration = Duration(seconds: secound));
  }
}

