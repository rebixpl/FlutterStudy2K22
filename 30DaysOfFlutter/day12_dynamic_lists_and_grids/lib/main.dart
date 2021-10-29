// Packages
import 'package:flutter/material.dart';

// Pages
import './pages/content_list_view/content_list_view.dart';
import './pages/content_grid_view/content_grid_view.dart';

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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            title: const Text("My Shop"),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Text("List"),
                Text("Grid"),
              ],
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              children: [
                LV_Content(),
                GV_Content(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
