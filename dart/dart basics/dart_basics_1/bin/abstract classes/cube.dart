import 'square.dart';

class Cube extends Square {
  double _height;

  Cube({required double side})
      : _height = side,
        super(side: side);

  double get height => _height;
  set height(double height) => _height = height;

  double getVolume() => super.getArea() * height;
}
