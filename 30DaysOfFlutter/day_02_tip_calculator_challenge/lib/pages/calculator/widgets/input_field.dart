import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController textFieldController;
  const InputField({Key? key, required this.textFieldController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        width: 70.0,
        height: 50.0,
        child: TextField(
          controller: textFieldController,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(hintText: "100 PLN"),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
      ),
    );
  }
}
