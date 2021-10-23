// Packages
import 'package:flutter/material.dart';

// Pages
import './pages/webview.dart';

// Themes
import 'config/theme_dark.dart';
import 'config/theme_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myThemeLight, // light theme
      darkTheme: myThemeDark, // dark theme
      themeMode: ThemeMode.system, // device controls theme
      debugShowCheckedModeBanner: false,
      home: const WebViewPage(),
    );
  }
}
