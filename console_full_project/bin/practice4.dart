main(List<String> args) {
  //-------------------------- Super Keyword
  // The super keyword is a reference variable which is used to refer
  // immediate parent class object. It is used to refer the superclass
  // properties and methods.
  // 1) The super keyword can be used to access the data members of parent class when both parent and child class have member with same name.
  // 2) The super keyword can be used to access the method of parent class when child class has overridden that method.
  SubClass objSubClass = SubClass();
  objSubClass.printNumber(); // => 50

  objSubClass.printMsg();
}

//-------------------------- Super Keyword
class SuperClass {
  int num = 50;

  void display() {
    print("Parent class method");
  }
}

class SubClass extends SuperClass {
  /* The same variable num is declared in the SubClass
    * which is already present in the SuperClass
    */
  int num = 233;
  void printNumber() {
    print(super.num);
  }

  // Overriding method
  @override
  void display() {
    print("Child class method");
  }

  void printMsg() {
    //This would call subclass method
    display();
    //This would call superclass method
    super.display();
  }
}
