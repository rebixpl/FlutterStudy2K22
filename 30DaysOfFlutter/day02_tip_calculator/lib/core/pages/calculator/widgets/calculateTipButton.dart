// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CalculateTipButton extends StatelessWidget {
  final Function() calculateTip;
  const CalculateTipButton({
    Key? key,
    required this.calculateTip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: calculateTip,
      child: const Text(
        "Calculate Tip",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      color: Colors.orange,
      textColor: Colors.white,
      minWidth: 150.0,
      height: 50.0,
    );
  }
}
