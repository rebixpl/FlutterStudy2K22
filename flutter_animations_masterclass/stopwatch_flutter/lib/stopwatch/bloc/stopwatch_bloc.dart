import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stopwatch_flutter/ticker.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  static const int _duration = 0;
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  StopwatchBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const StopwatchInitial(_duration)) {
    on<StopwatchStarted>(_onStarted);
    on<StopwatchTicked>(_onTicked);
    on<StopwatchPaused>(_onPaused);
    on<StopwatchResumed>(_onResumed);
    on<StopwatchReset>(_onReset);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(StopwatchStarted event, Emitter<StopwatchState> emit) {
    emit(const StopwatchRunInProgress(0));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick().listen(
          (duration) => add(
            StopwatchTicked(duration: duration),
          ),
        );
  }

  void _onTicked(StopwatchTicked event, Emitter<StopwatchState> emit) {
    emit(StopwatchRunInProgress(event.duration));
  }

  void _onPaused(StopwatchPaused event, Emitter<StopwatchState> emit) {
    if (state is StopwatchRunInProgress) {
      _tickerSubscription?.pause();
      emit(StopwatchRunPause(state.duration));
    }
  }

  void _onResumed(StopwatchResumed event, Emitter<StopwatchState> emit) {
    if (state is StopwatchRunPause) {
      _tickerSubscription?.resume();
      emit(StopwatchRunInProgress(state.duration));
    }
  }

  void _onReset(StopwatchReset event, Emitter<StopwatchState> emit) {
    _tickerSubscription?.cancel();
    emit(const StopwatchInitial(_duration));
  }
}
