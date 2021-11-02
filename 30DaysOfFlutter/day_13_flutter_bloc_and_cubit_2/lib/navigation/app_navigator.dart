// Packages
import 'package:day_13_flutter_bloc_and_cubit_2/pages/posts/posts_view.dart';
import 'package:flutter/material.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(child: PostsView()),
      ],
      onPopPage: (route, result) {},
    );
  }
}
