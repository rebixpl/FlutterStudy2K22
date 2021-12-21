import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({Key? key}) : super(key: key);

  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Opacity"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: 1),
              child: FlutterLogo(size: 200.0),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: _fadeLogo,
              child: Text("Fade Logo"),
            ),
          ],
        ),
      ),
    );
  }

  void _fadeLogo() {
    setState(() {
      _opacity == 0.0 ? _opacity = 1.0 : _opacity = 0.0;
    });
  }
}
