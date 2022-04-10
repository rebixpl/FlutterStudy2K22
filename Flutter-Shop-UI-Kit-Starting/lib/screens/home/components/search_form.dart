import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';

Form searchForm() {
  return Form(
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Search items...",
        filled: true,
        fillColor: Colors.white,
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset("assets/icons/Search.svg"),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding / 2,
          ),
          child: SizedBox(
            width: 48.0,
            height: 48.0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultBorderRadius),
                  ),
                ),
              ),
              child: SvgPicture.asset("assets/icons/Filter.svg"),
            ),
          ),
        ),
      ),
    ),
  );
}

OutlineInputBorder outlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(kDefaultBorderRadius),
    ),
    borderSide: BorderSide.none,
  );
}
