import 'package:flutter/material.dart';

class TogglesButtons extends StatelessWidget {
  final List<bool> togglesSelection;
  final Function(int) togglePressed;
  const TogglesButtons({
    Key? key,
    required this.togglesSelection,
    required this.togglePressed,
  }) : super(key: key);

  static const List<String> togglesValues = [
    "23",
    "25",
    "08",
  ];

  static final List<Widget> _togglesValuesWidgets =
      togglesValues.map((String value) => Text("$value%")).toList();

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: _togglesValuesWidgets,
      isSelected: togglesSelection,
      onPressed: togglePressed,
    );
  }
}
