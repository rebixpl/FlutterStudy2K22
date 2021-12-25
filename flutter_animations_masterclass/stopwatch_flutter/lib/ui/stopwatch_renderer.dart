import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({
    Key? key,
    required this.elapsed,
    required this.radius,
  }) : super(key: key);

  final Duration elapsed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3.0, color: Colors.orange),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            rotationZAngle: pi * (2 * pi / 60000) * elapsed.inMilliseconds,
            handThickness: 2.0,
            handLength: radius,
            color: Colors.orange,
          ),
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

  /* MATRIX TRANSFORM
  Matrix4.translationValues(50, 100, 30) // X,Y,Z
  Matrix4.rotationZ(pi / 4)

  // Each widget have origin on the top left corner and operations like
  // rotation or scale are relative to that origin
  // To easily change origin we can use for example:
  alignment: Alignment.center,

  // Multiple matrix changes at once:
   transform: Matrix4.identity()
            ..translate(50.0, 0.0, 0.0)
            ..rotateZ(pi / 4),
  */
}
