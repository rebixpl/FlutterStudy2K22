// Packages
import 'package:flutter/material.dart';

class UserDetailsView extends StatelessWidget {
  static const valueKey = ValueKey("poop");
  final String user;
  const UserDetailsView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
      ),
      body: Center(
        child: Text("Hello, $user"),
      ),
    );
  }
}
