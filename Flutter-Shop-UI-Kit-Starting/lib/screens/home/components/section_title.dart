import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback pressSeeAll;

  const SectionTitle({
    Key? key,
    required this.pressSeeAll,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
        ),
        TextButton(
          onPressed: pressSeeAll,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              kPrimaryColor.withOpacity(0.2),
            ),
          ),
          child: const Text(
            "See All",
            style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    );
  }
}
