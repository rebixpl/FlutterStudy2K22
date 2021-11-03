// Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc
import "./pages/posts/bloc/posts_bloc.dart";
import './navigation/nav_cubit.dart';

// Navigator
import 'navigation/app_navigator.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PostsBloc>(
            create: (context) => PostsBloc()..add(LoadPostsEvent()),
          ),
          BlocProvider<NavCubit>(
            create: (context) => NavCubit(),
          ),
        ],
        child: const AppNavigator(),
      ),
    );
  }
}
