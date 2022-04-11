import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/product.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 24.0,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: product.bgColor,
      body: Column(
        children: [
          Image.asset(
            product.image,
            height: MediaQuery.of(context).size.height * 0.4, // 40%
            fit: BoxFit.cover,
          ),
          const SizedBox(height: kDefaultPadding),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                kDefaultPadding,
                kDefaultPadding * 2,
                kDefaultBorderRadius,
                kDefaultPadding,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultBorderRadius * 3),
                  topRight: Radius.circular(kDefaultBorderRadius * 3),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding),
                        Text(
                          "\$${product.price}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: Text(
                          "Unisex ADULT ULTRA SOFT high quality t-shirts for men & women; Add your customized design for Uniforms, Sport Wears, Daily Fashion, Family Shirts,"),
                    ),
                    const Text(
                      "Colors",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding / 2),
                    Row(
                      children: [
                        ColorDot(
                          color: const Color(0xFFBEE8EA),
                          onPress: () {},
                          isActive: false,
                        ),
                        ColorDot(
                          color: const Color.fromARGB(255, 255, 224, 124),
                          onPress: () {},
                          isActive: true,
                        ),
                        ColorDot(
                          color: const Color.fromARGB(255, 31, 31, 31),
                          onPress: () {},
                          isActive: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding / 1.5),
                    Center(
                      child: SizedBox(
                        width: 200.0,
                        height: 48.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Add to cart"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    required this.onPress,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;
  final Color color;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: isActive ? kPrimaryColor : Colors.transparent,
          ),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 10.0,
          backgroundColor: color,
        ),
      ),
    );
  }
}
