import 'package:flutter/material.dart';

import 'package:flutter_timer/timer/timer.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Potężny Timer",
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        colorScheme: const ColorScheme.light(
          secondary: Colors.deepOrangeAccent,
          primary: Colors.deepOrangeAccent,
        ),
      ),
      home: const TimerPage(),
    );
  }
}
