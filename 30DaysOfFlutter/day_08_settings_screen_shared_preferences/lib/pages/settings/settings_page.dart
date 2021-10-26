// Packages
import 'package:flutter/material.dart';

// Models
import '../../models/models.dart';

// Widgets
import './widgets/username_text_field.dart';
import './widgets/gender_list_tile.dart';
import './widgets/appbar_settings_page.dart';
import './widgets/language_checkbox.dart';
import './widgets/save_settings_button.dart';

// Services
import '../../services/preferences_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _usernameController = TextEditingController();

  Gender _selectedGender = Gender.MALE;
  Set<ProgrammingLanguage> _selectedLanguages = <ProgrammingLanguage>{};
  bool _isEmployed = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsScreenAppBar(),
      body: ListView(
        children: [
          UsernameTextField(_usernameController),
          //---------- Gender
          ..._buildGenderSelector(),
          _buildDivider(),
          //---------- Language
          ..._buildLanguageSelector(),
          _buildDivider(),
          //---------- Is Employed
          SwitchListTile(
            title: const Text("Is Employed"),
            value: _isEmployed,
            onChanged: (newValue) {
              setState(() {
                _isEmployed = newValue;
              });
            },
          ),
          _buildDivider(),
          //---------- Save Button
          SaveButton(_saveSettings),
        ],
      ),
    );
  }

  Divider _buildDivider() {
    return const Divider(
      thickness: 2.0,
      color: Colors.grey,
      indent: 20.0,
      endIndent: 20.0,
    );
  }

  List<LanguageCheckbox> _buildLanguageSelector() {
    List<LanguageCheckbox> _languageCheckboxes = [];
    for (var i = 0; i < ProgrammingLanguage.values.length; i++) {
      _languageCheckboxes.add(
        LanguageCheckbox(
          _selectedLanguages,
          notifyParent: refresh,
          index: i,
        ),
      );
    }
    return _languageCheckboxes;
  }

  List<GenderListTile> _buildGenderSelector() {
    List<GenderListTile> _genderListTiles = [];
    for (var i = 0; i < Gender.values.length; i++) {
      _genderListTiles.add(
        GenderListTile(
          index: i,
          selectedGender: _selectedGender,
          selectedGenderCallback: (Gender selectedGender) {
            _selectedGender = selectedGender;
            refresh();
          },
        ),
      );
    }
    return _genderListTiles;
  }

  void _saveSettings() {
    final newSettings = Settings(
      gender: _selectedGender,
      isEmployed: _isEmployed,
      programmingLanguages: _selectedLanguages,
      username: _usernameController.text,
    );

    PreferencesService.saveSettings(newSettings);
  }

  void _populateFields() async {
    final Settings settings = await PreferencesService.getSettings();

    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _selectedLanguages = settings.programmingLanguages;
      _isEmployed = settings.isEmployed;
    });
  }

  /// Refresh the app UI
  refresh() {
    setState(() {});
  }
}
