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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class Contact {
  final String name;

  const Contact({
    required this.name,
  });
}

class ContactBook {
  // ContactBook is a singleton class
  // private constructor - _ means private
  ContactBook._sharedInstance();
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  // Notice that contacts are PRIVATE list
  final List<Contact> _contacts = [];

  int get length => _contacts.length;

  void add({required Contact contact}) {
    _contacts.add(contact);
  }

  void remove({required Contact contact}) {
    _contacts.remove(contact);
  }

  Contact? contact({required int atIndex}) =>
      _contacts.length > atIndex ? _contacts[atIndex] : null;
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactBook = ContactBook();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: contactBook.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = contactBook.contact(atIndex: index)!;
          return ListTile(
            title: Text(contact.name),
          );
        },
      ),
    );
  }
}
