import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:developer' as devtools show log;

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
    );
  }
}

enum AvailableColors { one, two }

class AvailableColorsModel extends InheritedModel<AvailableColors> {
  final AvailableColors color1;
  final AvailableColors color2;

  const AvailableColorsModel({
    Key? key,
    required this.color1,
    required this.color2,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static AvailableColorsModel of(
    BuildContext context,
    AvailableColors aspect,
  ) {
    return InheritedModel.inheritFrom<AvailableColorsModel>(
      context,
      aspect: aspect,
    )!;
  }

  @override
  bool updateShouldNotify(covariant AvailableColorsModel oldWidget) {
    // Flutter decided whether any descendant has to be rebuilt by callingupdateShouldNotify()
    devtools.log("updateShouldNotify");
    return (color1 != oldWidget.color1) || (color2 != oldWidget.color2);
  }

  @override
  bool updateShouldNotifyDependent(
    covariant AvailableColorsModel oldWidget,
    Set<AvailableColors> dependencies,
  ) {
    // if updateShouldNotify() is true, than this function will be called
    devtools.log('updateShouldNotifyDependent');

    if (dependencies.contains(AvailableColors.one) &&
        color1 != oldWidget.color1) {
      return true;
    }

    if (dependencies.contains(AvailableColors.two) &&
        color2 != oldWidget.color2) {
      return true;
    }

    return false;
  }
}

final colors = [
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.cyan,
  Colors.brown,
  Colors.amber,
  Colors.deepPurple,
];

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(Random().nextInt(length));
}
