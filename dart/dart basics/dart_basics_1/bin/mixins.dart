class George {
  void breathe() => print("I can't breathe");
}

class Dolphin extends George with Swimming {}

class Shark extends George with Swimming {}

class Bat extends George with Flying {}

class Dove extends George with Flying {}

class Dog extends George with Swimming {}

mixin Swimming {
  void swim() => print("Swimming");
}

mixin Flying {
  void fly() => print("Flying");
}

void main(List<String> args) {
  var dog = Dog();
  // var swim = Swimming(); // Mixins can't be instantiated
}
