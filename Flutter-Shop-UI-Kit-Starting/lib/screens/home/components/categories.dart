import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          demoCategories.length,
          (index) => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: CategoryCard(
              icon: demoCategories[index].icon,
              title: demoCategories[index].title,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String icon, title;
  final VoidCallback onPressed;

  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        ),
        primary: kPrimaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 4,
          vertical: kDefaultPadding / 2,
        ),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
