// Packages
import 'package:flutter/material.dart';

class UsersView extends StatelessWidget {
  static const List<String> _users = [
    "Kyle",
    "John",
    "Pablo",
    "Adrianna",
    "Xavier",
    "Maya"
  ];

  final ValueChanged didSelectUser;

  const UsersView({Key? key, required this.didSelectUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context, index) {
          final _user = _users[index];
          return Card(
            child: ListTile(
              title: Text(_user),
              onTap: () => didSelectUser(_user),
            ),
          );
        },
      ),
    );
  }
}
