part of 'laps_bloc.dart';

abstract class LapsEvent extends Equatable {
  const LapsEvent();

  @override
  List<Object> get props => [];
}

class LapAdded extends LapsEvent {
  const LapAdded({required this.lapDuration});
  final int lapDuration;

  @override
  List<Object> get props => [lapDuration];
}

class LapsReset extends LapsEvent {
  const LapsReset();
}
