import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static List<String> restaurants = const [
    "McDonald's",
    "Chickens and kremówka",
    "Kebab Luxor",
    "Kebab Malik",
    "Pizza Hut",
    "Panda Express",
    "Olive Garden",
  ];

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("What do you want to eat?"),
              Text(
                restaurants[currentIndex],
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(top: 50.0)),
              MaterialButton(
                onPressed: () => updateIndex(),
                child: const Text(
                  "Pick Restaurant",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                elevation: 6.0,
                color: Colors.black,
                textColor: Colors.white,
                height: 50.0,
                minWidth: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      currentIndex = index;
    });
  }
}
