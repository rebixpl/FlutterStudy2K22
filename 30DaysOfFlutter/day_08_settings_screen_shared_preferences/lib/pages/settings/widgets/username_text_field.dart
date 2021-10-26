// Packages
import 'package:flutter/material.dart';

class UsernameTextField extends StatelessWidget {
  final TextEditingController usernameController;
  const UsernameTextField(this.usernameController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: usernameController,
        decoration: const InputDecoration(labelText: "Username"),
      ),
    );
  }
}
