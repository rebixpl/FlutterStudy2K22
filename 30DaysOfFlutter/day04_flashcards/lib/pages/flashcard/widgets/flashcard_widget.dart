// Packages
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

// Widgets
import './flashcard_face.dart';

// Classes
import '../classes/flashcard.dart';

class FlashcardWidget extends StatelessWidget {
  final List<Flashcard> flashcards;
  final int currentIndex;
  const FlashcardWidget({
    Key? key,
    required this.flashcards,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: 250.0,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: FlashcardFace(
          language: flashcards[currentIndex].questionLang,
          content: flashcards[currentIndex].question,
        ),
        back: FlashcardFace(
          language: flashcards[currentIndex].answerLang,
          content: flashcards[currentIndex].answer,
        ),
      ),
    );
  }
}
