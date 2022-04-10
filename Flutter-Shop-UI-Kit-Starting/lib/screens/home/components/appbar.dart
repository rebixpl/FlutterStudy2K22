import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        "assets/icons/menu.svg",
        height: 18.0,
      ),
    ),
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0),
          child: SvgPicture.asset("assets/icons/Location.svg"),
        ),
        const SizedBox(width: kDefaultPadding / 2),
        Text(
          "21/37 New Texas",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/Notification.svg',
          height: 36.0,
        ),
      ),
    ],
  );
}
