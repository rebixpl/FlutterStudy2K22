class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - (x + 1))
        .take(ticks);
  }
}

// This stream is responsible to do a task for each second 
// Stream.periodic(Duration(seconds: 1), (x) {
//     return ticks - x - 1;
// })

// With take, stream does it's job only `ticks` times
// Stream.periodic(Duration(seconds: 1), (x) {
//     return ticks - x - 1;
// }).take(ticks);