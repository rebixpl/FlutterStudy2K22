import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/stopwatch/ui/clock_markers.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(seconds: i, radius: radius),
          ),
        for (int i = 5; i <= 60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: ClockTextMarker(
              value: i,
              maxValue: 60,
              radius: radius,
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
