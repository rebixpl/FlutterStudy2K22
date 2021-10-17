import 'package:console_full_project/console_full_project.dart'
    as console_full_project;

void main(List<String> arguments) {
  print('Hello world: ${console_full_project.calculate()}!');

  List<int> x = [1, 2, 3];
  List<int> xx = [...x];

  print("\n$xx\n");

  //---------------------------- SOME NULL SAFETY EXPERIMENTS
  var a = [1, 2, 3];
  var b = [4, 5, 6];
  var c = null;

  List<Object> d = [...a, ...b]; // => [1, 2, 3, 4, 5, 6]
  List<Object> e = [
    ...a,
    ...?c
  ]; // if c == null, it will not add c values // => [1, 2, 3]
  print(d);
  print(e);

  //-------------------------- SETS
  var set1 = Set();
  print(set1);
  set1.add(774);

  Set<String> set2 = {"Hey", "JD2137"};
  print(set2);

  var set3 = {1, 2, 3};
  print(set3);

  // this is a SET
  var set4 = <int>{};
  print(set4.runtimeType);

  // this is a MAP
  var map4 = {};
  print(map4.runtimeType);

  set4
    ..add(4)
    ..addAll(set3);
  set4.add(5);

  set4.addAll({6, 7, 8, ...set1});
  print(set4);
  print(set4.intersection(set3));

  //-------------------------- MAPS
  print("\n");

  var map1 = {};
  print(map1);

  var map2 = Map();
  print(map2);

  var map3 = {
    1: 1,
    2: 2,
    3: 3,
  };
  print(map3[2]);

  map1.addEntries([
    MapEntry("id", "2137sus"),
    MapEntry("pass", "janek2137"),
  ]);

  map4 = {...map3};
  map4.addAll(map1);
  print(map4);

  //-------------------------- RUNES
  var runes = Runes("Hello")
      .map(
        (e) => e.toRadixString(16).padLeft(4, "0"),
      )
      .toList();
  print(runes);
  String hello = "\u{0048}\u{0065}\u{006c}\u{006c}\u{006f}"; // Hello
  print(hello);
}

// Using null safety, incorrectly:
class HttpResponse {
  final int code;
  final String? error;

  HttpResponse.ok()
      : code = 200,
        error = null;
  HttpResponse.notFound()
      : code = 404,
        error = 'Not found';

  @override
  String toString() {
    if (code == 200) return 'OK';
    return 'ERROR $code ${error?.toUpperCase()}';
  }
}
