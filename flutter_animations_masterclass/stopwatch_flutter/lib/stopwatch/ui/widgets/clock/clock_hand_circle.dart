import 'package:flutter/material.dart';

class ClockHandCircle extends StatelessWidget {
  const ClockHandCircle({Key? key}) : super(key: key);

  final double _size = 14.0;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..translate(-_size / 2, -_size / 2, 0.0),
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2.0),
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }
}
