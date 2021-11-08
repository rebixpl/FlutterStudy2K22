import 'package:bloc/bloc.dart';

import '../lib/bloc/bloc.dart';

void main(List<String> arguments) async {
  // Basic Usage
  final bloc = CounterBloc();
  print(bloc.state);
  bloc.add(Increment());
  await Future.delayed(Duration.zero);
  print(bloc.state);
  await bloc.close();

  // Stream Usage
  final bloc2 = CounterBloc();
  final subscription = bloc2.stream.listen((event) {
    print("Subscription: $event");
  });
  bloc2.add(Increment());
  bloc2.add(Increment());
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await bloc2.close();

  // BlocObserver
  Bloc.observer = SimpleBlocObserver();

  // Observing a Bloc
  CounterBloc()
    ..add(Increment())
    ..add(Increment())
    ..close();
}
