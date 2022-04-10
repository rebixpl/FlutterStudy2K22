import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/home/components/appbar.dart';
import 'package:stylish/screens/home/components/categories.dart';
import 'package:stylish/screens/home/components/search_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
            ),
            const Text(
              "Best Outfits For You",
              style: TextStyle(fontSize: 18.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: searchForm(),
            ),
            const Categories()
          ],
        ),
      ),
    );
  }
}
