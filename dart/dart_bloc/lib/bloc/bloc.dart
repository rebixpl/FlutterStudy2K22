import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class ThisIsAnError extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event, emit) {
      emit(state + 1);
    });

    on<ThisIsAnError>((event, emit) {
      addError(Exception('This is an error'), StackTrace.current);
      emit(state + 1);
    });
  }

  // Observing a Bloc
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  // The change from one state to another is called a Transition.
  // A Transition consists of the current state, the event, and the
  // next state.

  // onTransition is invoked before onChange and contains the event
  // which triggered the change from currentState to nextState.
  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print(transition);
  }

  // onEvent  is called whenever a new event is added to the Bloc
  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print("$error, $stackTrace");
    super.onError(error, stackTrace);
  }
}

// BlocObserver
class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print("${bloc.runtimeType} $change");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("${bloc.runtimeType} $transition");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print("${bloc.runtimeType} $error $stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  // onEvent  is called whenever a new event is added to the Bloc
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }
}
