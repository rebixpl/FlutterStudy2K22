// ignore_for_file: unnecessary_getters_setters

// Getters and setters
class Employee {
  String _name = "Jake";
  int _age = 24;
  int _salary = 4000;

  // Name
  String get empName => _name;

  set empName(String name) {
    _name = name;
  }

  // Age
  set empAge(int age) => age <= 18
      ? print("Employee Age should be greater than 18 Years.")
      : _age = age;

  int get empAge {
    return _age;
  }

  // Salary
  set empSalary(int salary) {
    if (salary <= 0) {
      print("Salary should be greater than 0");
    } else {
      _salary = salary;
    }
  }

  int get empSalary {
    return _salary;
  }
}

// TYPEDEF
typedef LoggerOutputFunction = void Function(String msg);

class Logger {
  /// Prints out a string to console
  late LoggerOutputFunction out;

  Logger() {
    out = print;
  }

  void log(String msg) {
    out(msg);
  }
}

void timestampLoggerOutputFunction(String msg) {
  String timestamp = DateTime.now().toString();
  print("$timestamp : $msg");
}

main(List<String> args) {
  // Getters and setters
  Employee emp = Employee();
  emp.empName = 'John';
  emp.empAge = 25;
  emp.empSalary = 25000;
  print("Employee's Name Is : ${emp.empName}");
  print("Employee's Age Is : ${emp.empAge}");
  print("Employee's Salary Is : ${emp.empSalary}");

  // TYPEDEF
  Logger l = Logger();
  l.out("hello from out");
  l.log("hello world");
  l.out = timestampLoggerOutputFunction;
  l.log("hello world");
}
