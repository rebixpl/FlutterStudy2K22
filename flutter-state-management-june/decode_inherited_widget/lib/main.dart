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
      body: BuildInheritedWidget(
        child: const CounterPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BuildInheritedWidget extends StatefulWidget {
  const BuildInheritedWidget({Key? key}) : super(key: key);


  @override
  State<BuildInheritedWidget> createState() => _BuildInheritedWidgetState();

}

class _BuildInheritedWidgetState extends State<BuildInheritedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
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
