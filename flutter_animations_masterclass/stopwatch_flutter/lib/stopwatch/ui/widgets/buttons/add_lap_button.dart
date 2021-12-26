import 'package:flutter/material.dart';

class AddLapButton extends StatelessWidget {
  const AddLapButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      height: 60.0,
      child: ClipOval(
        child: Material(
          color: Colors.grey[900],
          child: InkWell(
            onTap: onPressed,
            child: const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
