import 'package:flutter/material.dart';

class CalculateTipButton extends StatelessWidget {
  final Function() onPressed;
  const CalculateTipButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: MaterialButton(
        onPressed: onPressed,
        child: const Text(
          "Calculate Tip",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        textColor: Colors.white,
        height: 50.0,
        minWidth: 150.0,
        color: Colors.indigoAccent,
      ),
    );
  }
}
