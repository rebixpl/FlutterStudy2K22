import 'dart:math';

import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  const ClockHand({
    Key? key,
    required this.rotationZAngle,
    required this.handThickness,
    required this.handLength,
    required this.color,
  }) : super(key: key);

  final double rotationZAngle;
  final double handThickness;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handThickness / 2)
        ..rotateZ(rotationZAngle),
      child: Stack(
        children: [
          Container(
            height: handLength,
            width: handThickness,
            color: color,
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..translate(handThickness * 5.5, handLength / 1.09, 0.0)
              ..rotateZ(90 * pi / 180),
            child: SizedBox(
              width: handThickness,
              height: handThickness,
              child: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
