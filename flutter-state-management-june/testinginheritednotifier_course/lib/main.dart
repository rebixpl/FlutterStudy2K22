import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class SliderData extends ChangeNotifier {
  // ChangeNotifier holds onto a state
  // We could use here also a ValueNotifier instead of ChangeNotifier
  double _value = 0.0;

  double get value => _value;

  set value(newValue) {
    if (newValue != _value) {
      _value = newValue;
      notifyListeners();
    }
  }
}

final sliderData = SliderData();

class SliderInheritedNotifier extends InheritedNotifier<SliderData> {
  // Listens to ChangeNotifier and rebuilds its child
  // InheritedNotifier will rebuild its child whenever the SliderData ChangeNotifier it's
  // listening to calls notifyListeners()

  const SliderInheritedNotifier({
    Key? key,
    required SliderData sliderData,
    required Widget child,
  }) : super(
          key: key,
          notifier: sliderData,
          child: child,
        );

  static double of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<SliderInheritedNotifier>()
          ?.notifier
          ?.value ??
      0.0;
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        children: [
          Slider(
            value: 0.0,
            onChanged: (value) {},
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 200.0,
              ),
              Container(
                color: Colors.blueGrey,
                height: 200.0,
              ),
            ].expandEqually().toList(),
          ),
        ],
      ),
    );
  }
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map(
        (w) => Expanded(
          child: w,
        ),
      );
}
