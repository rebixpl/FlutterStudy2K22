// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AmountTextField extends StatelessWidget {
  final TextEditingController controller;
  const AmountTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.0,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(hintText: "100.00 PLN"),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}
