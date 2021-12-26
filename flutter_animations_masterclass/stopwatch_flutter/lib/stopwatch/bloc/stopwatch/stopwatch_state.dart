part of 'stopwatch_bloc.dart';

abstract class StopwatchState extends Equatable {
  final int duration;

  const StopwatchState(this.duration);

  @override
  List<Object> get props => [duration];
}

class StopwatchInitial extends StopwatchState {
  const StopwatchInitial(int duration) : super(duration);

  @override
  String toString() => "StopwatchInitial { duration: $duration }";
}

class StopwatchRunPause extends StopwatchState {
  const StopwatchRunPause(int duration) : super(duration);

  @override
  String toString() => "StopwatchRunPause { duration: $duration }";
}

class StopwatchRunInProgress extends StopwatchState {
  const StopwatchRunInProgress(int duration) : super(duration);

  @override
  String toString() => "StopwatchRunInProgress { duration: $duration }";
}
