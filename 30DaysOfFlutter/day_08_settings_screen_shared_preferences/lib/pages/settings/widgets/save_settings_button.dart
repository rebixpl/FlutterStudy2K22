// Packages
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function() onTap;
  const SaveButton(this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: const Text("Save Settings"),
    );
  }
}
