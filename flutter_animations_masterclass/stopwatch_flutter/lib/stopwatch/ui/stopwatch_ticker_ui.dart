// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:stopwatch_flutter/timer/ui/clock_hand.dart';
// import 'package:stopwatch_flutter/timer/ui/elapsed_time_text.dart';

// class StopwatchTickerUI extends StatelessWidget {
//   const StopwatchTickerUI({
//     Key? key,
//     required this.radius,
//   }) : super(key: key);

//   final double radius;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           left: radius,
//           top: radius,
//           child: ClockHand(
//             rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
//             handThickness: 2.0,
//             handLength: radius,
//             color: Colors.orange,
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           top: radius * 1.3,
//           child: ElapsedTimeText(
//             elapsed: elapsed,
//           ),
//         ),
//       ],
//     );
//   }
// }
