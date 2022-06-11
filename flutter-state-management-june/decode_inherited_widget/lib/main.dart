import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    devtools.log("Home Page Refreshed");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const BuildInheritedWidget(child: CounterPage()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BuildInheritedWidget.setState(() {}),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BuildInheritedWidget extends StatefulWidget {
  final Widget child;

  const BuildInheritedWidget({Key? key, required this.child}) : super(key: key);

  static final _BuildInheritedWidgetState state = _BuildInheritedWidgetState();

  @override
  // ignore: no_logic_in_create_state
  State<BuildInheritedWidget> createState() => state;

  static void setState(VoidCallback fn) => state.setState(fn);
}

class _BuildInheritedWidgetState extends State<BuildInheritedWidget> {
  @override
  Widget build(BuildContext context) => InheritedData(child: widget.child);

  // Override again merely to prevent the warning message
  @override
  void setState(VoidCallback fn) => super.setState(fn);
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = InheritedData.of(context)!;

    devtools.log("Counter Refreshed");

    return Container(
      width: 150.0,
      height: 200.0,
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${provider.data}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

class InheritedData extends InheritedWidget {
  final DataField object;

  get data => object.data;

  InheritedData({Key? key, required Widget child})
      : object = DataField(),
        super(key: key, child: child);

  static InheritedData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedData>();
  }

  @override
  bool updateShouldNotify(InheritedData oldWidget) {
    object.data = oldWidget.object.data + 1;
    return true;
  }
}

class DataField {
  int data = 0;
}
