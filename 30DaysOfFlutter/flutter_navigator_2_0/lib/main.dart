// Packages
import 'package:flutter/material.dart';

// Pages
import './pages/users_view/users_view.dart';
import './pages/user_details_view/user_details_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedUser = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
            child: UsersView(
              didSelectUser: (user) => setState(() {
                _selectedUser = user;
              }),
            ),
          ),
          if (_selectedUser.isNotEmpty)
            MaterialPage(
              child: UserDetailsView(user: _selectedUser),
              key: UserDetailsView.valueKey,
            ),
        ],
        onPopPage: (route, result) {
          final page = route.settings as MaterialPage;
          if (page.key == UserDetailsView.valueKey) _selectedUser = "";
          return route.didPop(result);
        },
      ),
    );
  }
}
