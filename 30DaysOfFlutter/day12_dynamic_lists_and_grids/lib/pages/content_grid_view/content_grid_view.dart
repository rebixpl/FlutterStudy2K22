// Packages
import 'package:flutter/material.dart';

// ignore: camel_case_types
class GV_Content extends StatelessWidget {
  const GV_Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) => Card(
        child: GridTile(
          child: Center(
            child: Text((index + 1).toString()),
          ),
        ),
      ),
    );
  }
}
