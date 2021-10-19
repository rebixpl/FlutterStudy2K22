main(List<String> args) {
  //-------------------------- ENUMERATION
  // An enumeration is a set of predefined named values,
  // called as members.
  print(DaysOfWeek.values);
  DaysOfWeek.values.forEach(
    (element) => print(element.toString() + " ${element.index}"),
  );

  //-------------------------- ASSERT STATEMENT
  // Assert  is used for testing boolean conditions. An assert
  // statement disrupt normal execution if a boolean condition is false.
  var str = null;
  assert(str !=
      null); // => Failed assertion: line 14 pos 10: 'str != null': is not true.

  // if you’re executing a dart file via command line, you need to enable asserts as follows –
  // dart --enable-asserts <file_name>.dart

  //--------------------------  OPTIONAL PARAMETERS
  testParam(12);
  testParam(12, 53);

  // Optional named parameter
  testParam2(12);
  testParam2(123, np1: 10);
  testParam2(123, np2: 20);
  testParam2(123, np1: 10, np2: 20);

  //--------------------------  Dart Factorial Program Using Recursion
  var num3 = 5;
  var f = fact(num3);
  print(f);
}

//--------------------------  Dart Factorial Program Using Recursion
int fact(int n) {
  if (n > 1) {
    return n * fact(n - 1);
  } else {
    return 1;
  }
}

// OPTIONAL PARAMETERS
testParam(p1, [o1]) {
  print("Param Value Is : $p1 and Option Param Valus Is : $o1");
}

// Optional named parameter
testParam2(p1, {np1, np2}) {
  print("Param Value Is : $p1");
  print("Named Param 1 Valus Is : $np1");
  print("Named Param 1 Valus Is : $np2");
}

enum DaysOfWeek {
  sun,
  mon,
  tue,
  wed,
  thu,
  fri,
  sat,
}
