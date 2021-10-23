import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final Function() showNextCard, showPreviousCard;
  const NavigationButtons({
    Key? key,
    required this.showNextCard,
    required this.showPreviousCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OutlinedButton.icon(
            onPressed: showPreviousCard,
            icon: const Icon(Icons.chevron_left),
            label: const Text("Prev"),
          ),
          OutlinedButton.icon(
            onPressed: showNextCard,
            icon: const Icon(Icons.chevron_right),
            label: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
