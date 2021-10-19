main(List<String> args) {
  //-------------------------- NAMED CONSTRUCTORS
  Employee emp1 = Employee();
  Employee emp2 = Employee.namedConst(text: "Hello World!");
  Employee emp3 = Employee.thisTest(empCode: "EMP001");

  //-------------------------- STATIC KEYWORD
  Employee2 emp4 = Employee2("John", 25000);
  Employee2 emp5 = Employee2("Keith", 30000);

  emp4.showEmpInfo();
  emp5.showEmpInfo();
}

//-------------------------- NAMED CONSTRUCTORS
class Employee {
  late String empCode;
  Employee() {
    print("Employee default constructor");
  }
  Employee.namedConst({required String text}) {
    print("Employee named constructor: $text");
  }
  Employee.thisTest({required String empCode}) {
    this.empCode = empCode;
    print("The Employee Code is : ${empCode}");
  }
}

class Employee2 {
//-------------------------- STATIC KEYWORD
//  The static variables and methods are part of the class instead
//  of a specific instance. The static keyword is used for a class
//  level variable and method that is the same for every instance
//  of a class;
// This means only a single copy of static variable is shared among
// all the instances of a class.
  static String empDebt = "MIS";
  String empName;
  int empSalary;

  Employee2(
    this.empName,
    this.empSalary,
  );

  showEmpInfo() {
    print("$empName has salary of $empSalary and debt of $empDebt");
  }
}
