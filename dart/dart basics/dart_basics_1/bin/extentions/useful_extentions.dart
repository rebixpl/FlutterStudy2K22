// I want to add 'ListAverage' method to 'List' only if it contains 'int' value.
extension ListAverage on List<int> {
  double average() {
    var sum = 0;
    for (var item in this) {
      sum += item;
    }
    return (sum / length);
  }
}
