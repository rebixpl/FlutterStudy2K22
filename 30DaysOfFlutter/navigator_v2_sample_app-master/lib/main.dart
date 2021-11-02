import 'package:flutter/material.dart';
import 'package:navigator_v2_sample_app/book.dart';
import 'package:navigator_v2_sample_app/book_page.dart';
import 'package:navigator_v2_sample_app/fake_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Book _selectedBook;

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
    debugPrint(_selectedBook.title);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
      home: Navigator(
        pages: [
          MaterialPage(
              child: HomePage(
            onTap: (Book book) => _handleBookTapped(book),
          )),
          if (_selectedBook != null)
            MaterialPage(
              child: BookPage(book: _selectedBook),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;

          setState(() {
            _selectedBook = null;
          });
          debugPrint(_selectedBook.toString());

          return true;
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final ValueChanged<Book> onTap;

  const HomePage({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(children: [
            SizedBox(height: 20),
            FakeAppBar(),
            SizedBox(height: 20),
            FakeTabBar(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                childAspectRatio: 48 / 78,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(books.length, (index) {
                  final book = books[index];
                  return InkWell(
                    onTap: () => onTap(book),
                    child: Card(
                      child: Image.asset(
                        book.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
