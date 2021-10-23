import 'package:flutter/material.dart';

MaterialColor primaryMaterialColor = const MaterialColor(
  4294967295,
  <int, Color>{
    50: Color.fromRGBO(
      255,
      255,
      255,
      .1,
    ),
    100: Color.fromRGBO(
      255,
      255,
      255,
      .2,
    ),
    200: Color.fromRGBO(
      255,
      255,
      255,
      .3,
    ),
    300: Color.fromRGBO(
      255,
      255,
      255,
      .4,
    ),
    400: Color.fromRGBO(
      255,
      255,
      255,
      .5,
    ),
    500: Color.fromRGBO(
      255,
      255,
      255,
      .6,
    ),
    600: Color.fromRGBO(
      255,
      255,
      255,
      .7,
    ),
    700: Color.fromRGBO(
      255,
      255,
      255,
      .8,
    ),
    800: Color.fromRGBO(
      255,
      255,
      255,
      .9,
    ),
    900: Color.fromRGBO(
      255,
      255,
      255,
      1,
    ),
  },
);

ThemeData myThemeLight = ThemeData(
  fontFamily: "customFont",
  primaryColor: const Color(0xffffffff),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
    ),
    button: TextStyle(
      color: Colors.black,
    ),
  ),
  buttonColor: const Color(0xffffffff),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color(0xffffffff),
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryMaterialColor)
      .copyWith(secondary: const Color(0xffffffff)),
  iconTheme: const IconThemeData(color: Colors.black),
);
