// Packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

/// {@template counter_observer}
/// [BlocObserver] for the counter application which
/// observes all state changes.
/// {@endtemplate}
class CounterObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint("${bloc.runtimeType} $change");
  }
}
