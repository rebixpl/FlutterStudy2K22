import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final Color bgColor;
  final int price;
  final VoidCallback press;

  const ProductCard({
    Key? key,
    required this.bgColor,
    required this.image,
    required this.press,
    required this.price,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154.0,
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              ),
              child: Image.asset(
                image,
                height: 132.0,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const SizedBox(width: kDefaultPadding / 2),
                Text(
                  "\$$price",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
