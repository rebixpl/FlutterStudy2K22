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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}

class InheritedData extends InheritedWidget {
  const InheritedData({Key? key, required Widget child})
      : super(key: key, child: child);

  static InheritedData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedData>();
  }

  @override
  bool updateShouldNotify(InheritedData oldWidget) {
    return true;
  }
}
