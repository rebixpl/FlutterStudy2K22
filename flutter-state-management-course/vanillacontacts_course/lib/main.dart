import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

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
      routes: {
        '/new-contact': (context) => const NewContactView(),
      },
    );
  }
}

class Contact {
  final String id;
  final String name;

  Contact({
    required this.name,
  }) : id = const Uuid().v4();
}

// VALUE NOTIFIER is a classic way of state management, currently it's
// used for very simple cases (and i think bloc is even easier to understand)
class ContactBook extends ValueNotifier<List<Contact>> {
  // ContactBook is a singleton class
  // private constructor - _ means private
  ContactBook._sharedInstance() : super([Contact(name: "Jake")]);
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  // Notice that contacts are PRIVATE list
  //final List<Contact> _contacts = []; // contacts list is no longer needed, as ValueNotifier holds List<Contact> value variable

  int get length => value.length;

  void add({required Contact contact}) {
    // value.add(contact); // this will not notify listeners, because we are not changing entire value, we are just changing internals of this list, so notifyListeners would not be called automatically
    final contacts =
        value; // contacts will have the same memory address as value, so
    // it will be the same variable, thus we don't need to write
    // 'value = contacts' at the end ???
    contacts.add(contact);
    notifyListeners();
  }

  void remove({required Contact contact}) {
    // _contacts.remove(contact);
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? contact({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ValueListenableBuilder(
        valueListenable: ContactBook(),
        builder: (context, value, child) {
          final contacts = value as List<Contact>;
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (BuildContext context, int index) {
              // final contact = contactBook.contact(atIndex: index)!;
              final contact = contacts[index];
              return Dismissible(
                onDismissed: (direction) {
                  ContactBook().remove(contact: contact);
                },
                key: ValueKey(contact.id),
                child: Material(
                  color: Colors.white,
                  elevation: 10.0,
                  child: ListTile(
                    title: Text(contact.name),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // .pushNamed method is a Future
          await Navigator.of(context).pushNamed("/new-contact");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewContactView extends StatefulWidget {
  const NewContactView({Key? key}) : super(key: key);

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new contact"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              hintText: "Enter new contact name here....",
            ),
          ),
          TextButton(
            onPressed: () {
              final Contact contact =
                  Contact(name: _textEditingController.text);
              ContactBook().add(contact: contact);
              Navigator.pop(context);
            },
            child: const Text("Add Contact"),
          ),
        ],
      ),
    );
  }
}
