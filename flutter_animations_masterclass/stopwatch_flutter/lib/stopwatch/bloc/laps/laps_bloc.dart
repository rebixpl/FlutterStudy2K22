import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'laps_event.dart';
part 'laps_state.dart';

class LapsBloc extends Bloc<LapsEvent, LapsState> {
  static const List<int> _laps = [];
  static const int _totalTime = 0;

  LapsBloc() : super(const LapsInitial(_laps, _totalTime)) {
    on<LapAdded>(_addLap);
    on<LapsReset>(_resetLaps);
  }

  void _addLap(LapAdded event, Emitter<LapsState> emit) {
    state.laps.add(event.lapDuration);

    emit(
      LapsRunInProgress(
        state.laps,
        state.laps.fold(0, (prev, curr) => prev + curr), // total time
      ),
    );
  }

  void _resetLaps(LapsReset event, Emitter<LapsState> emit) {
    state.laps.clear();
    emit(const LapsInitial(_laps, _totalTime));
  }
}
