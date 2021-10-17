//-------------------------- FUNCTIONS
main(List<String> args) {
  var functionObject = first;
  second(functionObject, 5);

  //-------------------------- ANONYMOUS FUNCTIONS
  var list = ["Hello", "everyone", "rebix"].map(
    (String s) => s.toUpperCase(),
  );
  print(list);

  //-------------------------- PARAMETERS
  requiredPositional(0, 1);
  optionalPositional(12);
  requiredNamed(a: 20, b: 30);
  optionalNamed(b: 20);
  optionalNamed(b: 20, a: 5);
  namedHybrid(a: 20);
  mixOfParams(20, 30);

  //-------------------------- CALLABLE CLASS
  var a = A();
  a();

  StudentApi _studentApi = StudentApi();
  var msg = _studentApi("Ivan Piździec", 21);
  print(msg);
}

class A {
  void call() => print("I'm a function!");
}

class StudentApi {
  String call(String name, int age) {
    return ('Student name is $name and Age is $age');
  }
}

int first(int a) => a;

void second(int Function(int) f, int a) {
  print(f.call(a));
  print(f(a));
}

//-------------------------- PARAMETERS
void requiredPositional(int a, int b) => print('$a $b');
void optionalPositional([int a = 5, int? b]) => print('$a $b');
void requiredNamed({required int a, required int b}) => print('$a $b');
void optionalNamed({int a = 5, required int b}) => print('$a $b');
void namedHybrid({required int a, int b = 10}) => print('$a $b');
void mixOfParams(int a, int b, [int c = 5]) => print('$a $b $c');
