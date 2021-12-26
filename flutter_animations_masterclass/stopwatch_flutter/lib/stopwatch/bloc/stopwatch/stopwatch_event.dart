part of 'stopwatch_bloc.dart';

abstract class StopwatchEvent extends Equatable {
  const StopwatchEvent();

  @override
  List<Object> get props => [];
}

class StopwatchStarted extends StopwatchEvent {
  const StopwatchStarted();
}

class StopwatchPaused extends StopwatchEvent {
  const StopwatchPaused();
}

class StopwatchResumed extends StopwatchEvent {
  const StopwatchResumed();
}

class StopwatchReset extends StopwatchEvent {
  const StopwatchReset();
}

class StopwatchTicked extends StopwatchEvent {
  const StopwatchTicked({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}
