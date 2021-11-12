// Packages
import 'package:flutter/material.dart';

// Pages
import './counter/view/counter_page.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [CounterPage].
/// {@endtemplate}
class CounterApp extends MaterialApp {
  const CounterApp({Key? key})
      : super(
          key: key,
          home: const CounterPage(),
        );
}
