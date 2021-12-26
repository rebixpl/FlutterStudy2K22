import 'package:flutter/material.dart';

class ElapsedTimeText extends StatelessWidget {
  const ElapsedTimeText({
    Key? key,
    required this.elapsed,
    this.isLapList = false,
  }) : super(key: key);

  final Duration elapsed;
  final bool isLapList;

  @override
  Widget build(BuildContext context) {
    final hundreds = (elapsed.inMilliseconds / 10) % 100;
    final seconds = elapsed.inSeconds % 60;
    final minutes = elapsed.inMinutes % 60;
    final hundredsStr = hundreds.toStringAsFixed(0).padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    final digitWidth = isLapList ? 8.0 : 12.0;
    return Row(
      mainAxisAlignment:
          isLapList ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        TimeDigit(
          minutesStr.substring(0, 1),
          width: digitWidth,
          isLapList: isLapList,
        ),
        TimeDigit(
          minutesStr.substring(1, 2),
          width: digitWidth,
          isLapList: isLapList,
        ),
        TimeDigit(
          ':',
          width: 6,
          isLapList: isLapList,
        ),
        TimeDigit(
          secondsStr.substring(0, 1),
          width: digitWidth,
          isLapList: isLapList,
        ),
        TimeDigit(
          secondsStr.substring(1, 2),
          width: digitWidth,
          isLapList: isLapList,
        ),
        TimeDigit(
          '.',
          width: 6,
          isLapList: isLapList,
        ),
        TimeDigit(
          hundredsStr.substring(0, 1),
          width: digitWidth,
          isLapList: isLapList,
        ),
        TimeDigit(
          hundredsStr.substring(1, 2),
          width: digitWidth,
          isLapList: isLapList,
        ),
      ],
    );
  }
}

class TimeDigit extends StatelessWidget {
  const TimeDigit(
    this.text, {
    Key? key,
    required this.width,
    required this.isLapList,
  }) : super(key: key);

  final String text;
  final double width;
  final bool isLapList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(fontSize: isLapList ? 14.0 : 20.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
