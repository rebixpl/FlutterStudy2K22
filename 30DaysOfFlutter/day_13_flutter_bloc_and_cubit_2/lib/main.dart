// Packages
import 'package:day_13_flutter_bloc_and_cubit_2/pages/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Pages
import './pages/posts/posts_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PostsBloc>(
        create: (BuildContext context) => PostsBloc()..add(LoadPostsEvent()),
        child: const PostsView(),
      ),
    );
  }
}
