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
  var a1 = A();
  a1();

  StudentApi _studentApi = StudentApi();
  var msg = _studentApi("Ivan Piździec", 21);
  print(msg);

  //--------------------------  TYPE TEST OPERATORS
  // These operators are handy for checking types at runtime.
  var num2 = 3;
  print(num2 is int);

  var num3 = 5.35;
  var num3TypeTest = num3 is! int;
  print(num3TypeTest);

  //--------------------------    Conditional Operators
  // expr1 ?? expr2
  // If expr1 is non-null, returns its value; otherwise, evaluates and returns the value of expr2.
  var n1 = null;
  var n2 = 15;

  var res = n1 ?? n2;
  print(res); // => 15

  //--------------------------  Sets
  // Set is a unordered list of distinct values of same types.
  // Set is UNORDERED, and WON'T ALLOW DUPLICATES
  // var setName = <type>{};
  // Set<type> setName = {};

  var names = {"John", "Doe", "Smith", "Alex"}; // Map
  Set<String> persons = {}; // Set
  persons.add("Murphy");
  persons.addAll(names);
  print(persons);
  print(names.runtimeType);

  var p = persons.elementAt(2);
  print(p);

  var l = persons.length;
  print(l);

  // Dart Finding Element in a Set
  if (persons.contains("Doe")) {
    print("Given element found.");
  } else {
    print("Given element not found.");
  }

  // remove
  persons.remove("Doe");
  print(persons);

  // Dart Iterating Over a Set Elements
  persons.forEach((element) {
    print(element);
  });

  print(persons.toList());

  // Dart Set Operations
  var a = <int>{10, 12, 14, 16, 18};
  var b = <int>{5, 7, 9, 11, 13};
  var c = <int>{2, 3, 5, 7};
  print("W3Adda - Dart Set Operations");
  print("b union a is");
  print(b.union(a));
  print("b intersection a is");
  print(b.intersection(a));
  print("b difference c is");
  print(b.difference(c));
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
