class Ticker {
  const Ticker();
  Stream<int> tick() {
    return Stream.periodic(const Duration(milliseconds: 1), (x) => x);
  }
}
