// Abstract classes create a blueprint for class child, you can't create an object of abstract class
abstract class Rectangle {
  double _length;
  double _width;

  Rectangle({required double length, required double width})
      : _length = length,
        _width = width;

  // ignore: unnecessary_getters_setters
  double get length => _length;
  set length(double length) => _length = length;

  double get width => _width;
  set width(double length) => _width = width;

  // abstract method, every single class that extends Rectangle class, must have this method implemented
  double getArea();
}
