// Packages
import 'package:flutter/material.dart';

class MakeRequestButton extends StatelessWidget {
  final Function() onTap;
  const MakeRequestButton(this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text("Make Request"),
    );
  }
}
