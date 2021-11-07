import "package:bloc/bloc.dart";

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  // CounterCubit is exposing a public method called
  // increment which can be called externally to notify the
  // CounterCubit to increment its state.
  void increment() => emit(state + 1);

  // Every Cubit has an addError method which can be used to indicate
  // that an error has occurred.
  void thisFunctionGivesAnError() {
    addError(Exception("increment error!"), StackTrace.current);
    emit(state + 1);
  }

  // When a Cubit emits a new state, a Change occurs. We can observe all
  // changes for a given Cubit by overriding onChange.
  // A Change occurs just before the state of the Cubit is updated.
  // A Change consists of the currentState and the nextState.
  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}

// If we want to be able to do something in response to all Changes we
// can simply create our own BlocObserver.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  // BlockObserver onError overriden
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
