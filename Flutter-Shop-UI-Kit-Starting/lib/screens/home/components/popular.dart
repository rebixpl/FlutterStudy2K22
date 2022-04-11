import 'package:flutter/material.dart';
import 'package:stylish/models/product.dart';
import 'package:stylish/screens/details/details_screen.dart';
import 'package:stylish/screens/home/components/product_card.dart';
import 'package:stylish/screens/home/components/section_title.dart';

class Popular extends StatelessWidget {
  const Popular({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Popular",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(product: product),
                      ),
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
