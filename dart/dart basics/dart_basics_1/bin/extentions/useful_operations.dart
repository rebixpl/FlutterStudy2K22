class UsefulOperations {
  static double average(List<int> list) {
    var sum = 0;
    for (var item in list) {
      sum += item;
    }
    return (sum / list.length);
  }
}
