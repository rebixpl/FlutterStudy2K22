// Packages
import 'package:flutter/material.dart';

// Models
import '../../../models/models.dart';

class GenderListTile extends StatelessWidget {
  final int index;
  final Gender selectedGender;
  final Function(Gender?) onChanged;
  const GenderListTile({
    Key? key,
    required this.index,
    required this.selectedGender,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(_getGenderLabel(Gender.values[index])),
      value: Gender.values[index],
      groupValue: selectedGender,
      onChanged: onChanged,
    );
  }

  String _getGenderLabel(Gender gender) {
    switch (gender) {
      case Gender.FEMALE:
        return "Female";
      case Gender.MALE:
        return "Male";
      case Gender.OTHER:
        return "Other";
    }
  }
}
