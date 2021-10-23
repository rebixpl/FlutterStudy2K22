// Packages
import 'package:flutter/material.dart';

// Widgets
import './widgets/navigation_buttons.dart';
import './widgets/flashcard_widget.dart';

// Data
import './data/flashcards.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  _FlashcardsPageState createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlashcardWidget(
              flashcards: FlashcardsData.flashcards,
              currentIndex: _currentIndex,
            ),
            NavigationButtons(
              showNextCard: showNextCard,
              showPreviousCard: showPreviousCard,
            ),
          ],
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1 < FlashcardsData.flashcards.length)
          ? _currentIndex + 1
          : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex = (_currentIndex - 1 >= 0)
          ? _currentIndex - 1
          : FlashcardsData.flashcards.length - 1;
    });
  }
}
