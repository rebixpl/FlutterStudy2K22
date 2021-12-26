part of 'laps_bloc.dart';

abstract class LapsState extends Equatable {
  final List<int> laps;
  final int totalTime;
  const LapsState(this.laps, this.totalTime);

  @override
  List<Object> get props => [laps, totalTime];
}

class LapsInitial extends LapsState {
  const LapsInitial(List<int> laps, int totalTime) : super(laps, totalTime);

  @override
  String toString() => "LapsInitial { laps: $laps totalTime: $totalTime }";
}

class LapsRunInProgress extends LapsState {
  const LapsRunInProgress(List<int> laps, int totalTime)
      : super(laps, totalTime);

  @override
  String toString() =>
      "LapsRunInProgress { laps: $laps totalTime: $totalTime }";
}
