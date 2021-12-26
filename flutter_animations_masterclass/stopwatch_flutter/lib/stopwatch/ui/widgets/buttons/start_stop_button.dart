import 'package:flutter/material.dart';

class StartPauseButton extends StatelessWidget {
  const StartPauseButton({
    Key? key,
    this.onPressed,
    required this.isRunning,
  }) : super(key: key);

  final bool isRunning;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.0,
      height: 80.0,
      child: ClipOval(
        child: Material(
          color: isRunning ? Colors.red[900] : Colors.green[900],
          child: InkWell(
            onTap: onPressed,
            child: Align(
              alignment: Alignment.center,
              child: Text(isRunning ? "Pause" : "Start"),
            ),
          ),
        ),
      ),
    );
  }
}
