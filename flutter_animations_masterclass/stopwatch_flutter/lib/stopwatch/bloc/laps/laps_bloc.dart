import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
    // _lastTime -
    _laps.add(event.lapDuration);
    print("_laps: $_laps");
    emit(
      LapsRunInProgress(
        _laps,
        _laps.fold(0, (prev, curr) => prev + curr), // total time
      ),
    );
  }

  void _resetLaps(LapsReset event, Emitter<LapsState> emit) {
    _laps = [];
    print("_laps: $_laps");
    emit(const LapsInitial([], 0));
  }
}
