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
