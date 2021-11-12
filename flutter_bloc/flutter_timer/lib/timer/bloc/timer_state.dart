part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  // TimerState extends Equatable to optimize our code by ensuring that
  // our app does not trigger rebuilds if the same state occurs.

  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

/// ready to start counting down from the specified duration.
class TimerInitial extends TimerState {
  const TimerInitial(int duration) : super(duration);

  @override
  String toString() => "TimerInitial { duration: $duration }";
}

///  paused at some remaining duration.
class TimerRunPause extends TimerState {
  const TimerRunPause(int duration) : super(duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

///  actively counting down from the specified duration.
class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int duration) : super(duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

/// completed with a remaining duration of 0.
class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
