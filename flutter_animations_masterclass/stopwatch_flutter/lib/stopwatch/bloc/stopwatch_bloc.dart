import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  StopwatchBloc() : super(StopwatchInitial()) {
    on<StopwatchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
