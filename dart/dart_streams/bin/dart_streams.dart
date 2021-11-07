import 'dart:math';

import 'package:dart_streams/dart_streams.dart' as darts;

Stream<int> countStream(int to) async* {
  for (int i = 0; i < to; i++) {
    await Future.delayed(Duration(milliseconds: Random().nextInt(1000)));
    print("Loading: ${i + 1}0%");
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  int sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}

void main(List<String> arguments) async {
  print('Hello world: ${darts.calculate()}!');
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum);
}
