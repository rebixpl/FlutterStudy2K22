import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'laps_event.dart';
part 'laps_state.dart';

class LapsBloc extends Bloc<LapsEvent, LapsState> {
  int _lastTime = 0;
  List<int> _laps = [];

  LapsBloc() : super(const LapsInitial([], 0)) {
    on<LapAdded>(_addLap);
    on<LapsReset>(_resetLaps);
  }

  void _addLap(LapAdded event, Emitter<LapsState> emit) {
    _laps.add(event.lapDuration - _lastTime);
    _lastTime = event.lapDuration;

    /// DEBUG
    debugPrint("_laps: $_laps");
    debugPrint(" total: " +
        _laps.fold(0, (int prev, int curr) => prev + curr).toString());

    /// DEBUG

    emit(
      LapsRunInProgress(
        _laps,
        _laps.fold(0, (int prev, int curr) => prev + curr), // total time
      ),
    );
  }

  void _resetLaps(LapsReset event, Emitter<LapsState> emit) {
    _laps = [];
    _lastTime = 0;
    debugPrint("_laps: $_laps");
    emit(const LapsInitial([], 0));
  }
}
