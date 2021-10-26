// Packages
import 'package:flutter/material.dart';

// Models
import '../../models/models.dart';

// Widgets
import './widgets/username_text_field.dart';
import './widgets/gender_list_tile.dart';
import './widgets/appbar_settings_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _usernameController = TextEditingController();

  Gender _selectedGender = Gender.MALE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsScreenAppBar(),
      body: ListView(
        children: [
          UsernameTextField(_usernameController),
          ..._buildGenderSelector(),
        ],
      ),
    );
  }

  List<GenderListTile> _buildGenderSelector() {
    List<GenderListTile> _genderListTiles = [];
    for (var i = 0; i < Gender.values.length; i++) {
      _genderListTiles.add(
        GenderListTile(
          index: i,
          selectedGender: _selectedGender,
          onChanged: (Gender? newGender) {
            setState(() {
              if (newGender != null) _selectedGender = newGender;
            });
          },
        ),
      );
    }
    return _genderListTiles;
  }
}
