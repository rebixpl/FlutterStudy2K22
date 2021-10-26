// Packages
import 'package:flutter/material.dart';

// Models
import 'package:day_08_settings_screen_shared_preferences/models/models.dart';

class LanguageCheckbox extends StatelessWidget {
  final int index;
  final Set<ProgrammingLanguage> selectedLanguages;
  final Function() notifyParent;
  const LanguageCheckbox(
    this.selectedLanguages, {
    Key? key,
    required this.notifyParent,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProgrammingLanguage currentLanguage = ProgrammingLanguage.values[index];
    return CheckboxListTile(
      title: Text(_getCheckboxTitle(currentLanguage)),
      value: selectedLanguages.contains(currentLanguage),
      onChanged: (_) {
        selectedLanguages.contains(currentLanguage)
            ? selectedLanguages.remove(currentLanguage)
            : selectedLanguages.add(currentLanguage);

        // After changes call Parent setState function
        notifyParent();
      },
    );
  }

  String _getCheckboxTitle(ProgrammingLanguage lang) {
    switch (lang) {
      case ProgrammingLanguage.CPP:
        return "C++";
      case ProgrammingLanguage.DART:
        return "Dart";
      case ProgrammingLanguage.JAVASCRIPT:
        return "JavaScript";
      case ProgrammingLanguage.SWIFT:
        return "Swift";
    }
  }
}
