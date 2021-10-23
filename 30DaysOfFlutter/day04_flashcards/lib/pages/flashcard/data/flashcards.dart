// Classes
import '../classes/flashcard.dart';

/// Contains list of all flashcards in the app
class FlashcardsData {
  static final List<Flashcard> flashcards = [
    Flashcard(
      questionLang: "EN",
      question: "How long have you been working here?",
      answerLang: "DE",
      answer: "Wie lange arbeitest du hier schon?",
    ),
    Flashcard(
      questionLang: "EN",
      question: "What’s Your Favorite Movie?",
      answerLang: "DE",
      answer: "Was ist dein Lieblingsfilm?",
    ),
    Flashcard(
      questionLang: "EN",
      question: "How Would You Want To Be Remembered?",
      answerLang: "DE",
      answer: "Wie möchten Sie in Erinnerung bleiben?",
    ),
  ];
}
