import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 200, _height = 200;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(16.0);

  final randomizer = Random();

  void _randomize() {
    setState(() {
      _width = randomizer.nextInt(300).toDouble();
      _height = randomizer.nextInt(400).toDouble();

      _color = Color.fromRGBO(
        randomizer.nextInt(256),
        randomizer.nextInt(256),
        randomizer.nextInt(256),
        1,
      );

      _borderRadius = BorderRadius.circular(
        randomizer.nextInt(60).toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          curve: Curves.easeOutQuart,
          duration: Duration(milliseconds: 300),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _randomize,
      ),
    );
  }
}
