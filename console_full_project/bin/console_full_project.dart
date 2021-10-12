import 'package:console_full_project/console_full_project.dart'
    as console_full_project;

void main(List<String> arguments) {
  print('Hello world: ${console_full_project.calculate()}!');

  List<int> x = [1, 2, 3];
  List<int> xx = [...x];

  print("\n$xx\n");

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
