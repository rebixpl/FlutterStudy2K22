// Packages
import 'package:flutter/material.dart';

// Widgets
import './widgets/board_tiles.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset('images/board.png'),
            const BoardTiles(),
          ],
        ),
      ),
    );
  }
}
