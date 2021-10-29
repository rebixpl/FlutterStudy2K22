// Packages
import 'package:flutter/material.dart';

// ignore: camel_case_types
class LV_Content extends StatelessWidget {
  const LV_Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text((index + 1).toString()),
          onTap: () => debugPrint("Hello from index: $index"),
        ),
      ),
    );
  }
}
