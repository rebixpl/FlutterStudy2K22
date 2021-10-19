main(List<String> args) {
  //--------------------------  Dart Super Constructor
  SubClass obj = SubClass();
  obj.display();

  Person p = Person(pName: "John", pAge: 25);
  p.showPerInfo();

  print("\n");

  Employee e = Employee("Keith", 43, 26000);
  e.showEmpInfo();
  e.showPerInfo();
}

class ParentClass {
  ParentClass(String str) {
    print("Parameterized Constructor Of Parent Class");
    print(str);
  }
}

//--------------------------  Dart Super Constructor
class SubClass extends ParentClass {
  SubClass() : super("Hello from Parent Class") {
    print("Constructor of Sub Class");
  }

  display() {
    print("Hello World!");
  }
}

class Person {
  late String name;
  late int age;

  Person({required String pName, required int pAge}) {
    this.name = pName;
    this.age = pAge;
  }

  showPerInfo() {
    print("Person's Name Is : $name");
    print("Person's Age Is : $age");
  }
}

class Employee extends Person {
  late int empSalary;

  Employee(String eName, int eAge, int eSalary)
      : super(pAge: eAge, pName: eName) {
    this.empSalary = eSalary;
  }

  showEmpInfo() {
    print("Employee Name Is : $name");
    print("Employee Age Is : $age");
    print("Employee Salary Is : $empSalary");
  }
}
