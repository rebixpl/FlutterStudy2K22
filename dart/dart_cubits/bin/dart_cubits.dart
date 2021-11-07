import 'package:bloc/bloc.dart';

import '../lib/cubits/basic_cubit.dart';

void main(List<String> arguments) async {
  final cubit = CounterCubit();
  print(cubit.state); // 0
  cubit.increment();
  print(cubit.state); // 1

  final subscription = cubit.stream.listen((value) {
    print("Cubit value: $value");
  });
  await Future.delayed(Duration(milliseconds: 600));
  cubit.increment();
  await Future.delayed(Duration(milliseconds: 200));
  await subscription.cancel();
  await cubit.close();

  print("\n\n");

  Bloc.observer = SimpleBlocObserver();

  CounterCubit()
    ..increment()
    ..increment()
    ..thisFunctionGivesAnError()
    ..close();
}
