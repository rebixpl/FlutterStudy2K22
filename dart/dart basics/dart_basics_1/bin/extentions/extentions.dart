import 'useful_extentions.dart';
import 'useful_operations.dart';

void main(List<String> args) {
  var list = [1, 2, 3, 4, 5, 6];
  print(UsefulOperations.average(list));
  print(list.average());
}
