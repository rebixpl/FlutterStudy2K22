// Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc
import './counter_observer.dart';

// App
import './app.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const CounterApp());
}
