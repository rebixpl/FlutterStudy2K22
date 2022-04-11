import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/product.dart';
import 'package:stylish/screens/home/components/appbar.dart';
import 'package:stylish/screens/home/components/categories.dart';
import 'package:stylish/screens/home/components/product_card.dart';
import 'package:stylish/screens/home/components/search_form.dart';
import 'package:stylish/screens/home/components/section_title.dart';

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
            const Categories(),
            const SizedBox(height: kDefaultPadding),
            const NewArrivals(),
          ],
        ),
      ),
    );
  }
}

class NewArrivals extends StatelessWidget {
  const NewArrivals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "New Arrival",
          pressSeeAll: () {},
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              demoProducts.length,
              (index) {
                final Product product = demoProducts[index];
                return ProductCard(
                  bgColor: product.bgColor,
                  image: product.image,
                  press: () {
                    debugPrint(
                      "User has clicked: ${product.title}",
                    );
                  },
                  price: product.price,
                  title: product.title,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
