import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.0,
      height: 80.0,
      child: ClipOval(
        child: Material(
          color: Colors.grey[900],
          child: InkWell(
            onTap: onPressed,
            child: const Align(
              alignment: Alignment.center,
              child: Text("Reset"),
            ),
          ),
        ),
      ),
    );
  }
}
