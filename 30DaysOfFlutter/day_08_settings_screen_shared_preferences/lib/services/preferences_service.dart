// ignore_for_file: constant_identifier_names

// Packages
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Models
import '../models/models.dart';

class PreferencesService {
  /// Saves settings locally on the device
  static Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString("username", settings.username);
    await preferences.setBool("isEmployed", settings.isEmployed);
    await preferences.setInt("gender", settings.gender.index);
    await preferences.setStringList(
        "programmingLanguages",
        settings.programmingLanguages
            .map((language) => language.index.toString())
            .toList());
    debugPrint("Saved settings!");
  }

  /// Loads the settings from device storage
  static Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username') ?? "";
    final isEmployed = preferences.getBool('isEmployed') ?? false;
    final gender = Gender.values[preferences.getInt("gender") ?? 0];

    final programmingLanguagesIndices =
        preferences.getStringList("programmingLanguages") ?? ["0"];

    final programmingLanguages = programmingLanguagesIndices
        .map(
          (String index) => ProgrammingLanguage.values[int.parse(index)],
        )
        .toSet();

    return Settings(
      gender: gender,
      isEmployed: isEmployed,
      programmingLanguages: programmingLanguages,
      username: username,
    );
  }
}
