import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/stopwatch/ui/widgets/clock/clock_hand.dart';
import 'package:stopwatch_flutter/stopwatch/ui/widgets/clock/clock_hand_circle.dart';
import 'package:stopwatch_flutter/stopwatch/ui/widgets/text/elapsed_time_text.dart';

class StopwatchTickerUI extends StatelessWidget {
  const StopwatchTickerUI({
    Key? key,
    required this.radius,
    required this.elapsed,
  }) : super(key: key);

  final double radius;
  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    double rotZAngle = pi + (2 * pi / 60000) * elapsed.inMilliseconds;
    return Stack(
      children: [
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            rotationZAngle: rotZAngle,
            handThickness: 2.0,
            handLength: radius,
            color: Colors.orange,
          ),
        ),
        Positioned(
          left: radius,
          top: radius,
          child: const ClockHandCircle(),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
