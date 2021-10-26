// ignore_for_file: constant_identifier_names

enum Gender {
  FEMALE,
  MALE,
  OTHER,
}

enum ProgrammingLanguage {
  DART,
  JAVASCRIPT,
  CPP,
  SWIFT,
}

/// Used for saving data on the device local storage
class Settings {
  final String username;
  final Gender gender;
  final Set<ProgrammingLanguage> programmingLanguages;
  final bool isEmployed;

  Settings({
    required this.gender,
    required this.isEmployed,
    required this.programmingLanguages,
    required this.username,
  });
}
