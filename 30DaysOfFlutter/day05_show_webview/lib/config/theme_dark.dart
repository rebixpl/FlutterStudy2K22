import 'package:flutter/material.dart';

MaterialColor primaryMaterialColor = const MaterialColor(
  4278190080,
  <int, Color>{
    50: Color.fromRGBO(
      0,
      0,
      0,
      .1,
    ),
    100: Color.fromRGBO(
      0,
      0,
      0,
      .2,
    ),
    200: Color.fromRGBO(
      0,
      0,
      0,
      .3,
    ),
    300: Color.fromRGBO(
      0,
      0,
      0,
      .4,
    ),
    400: Color.fromRGBO(
      0,
      0,
      0,
      .5,
    ),
    500: Color.fromRGBO(
      0,
      0,
      0,
      .6,
    ),
    600: Color.fromRGBO(
      0,
      0,
      0,
      .7,
    ),
    700: Color.fromRGBO(
      0,
      0,
      0,
      .8,
    ),
    800: Color.fromRGBO(
      0,
      0,
      0,
      .9,
    ),
    900: Color.fromRGBO(
      0,
      0,
      0,
      1,
    ),
  },
);

ThemeData myThemeDark = ThemeData(
  fontFamily: "customFont",
  primaryColor: const Color(0xff000000),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
    ),
    button: TextStyle(
      color: Colors.white,
    ),
  ),
  buttonColor: const Color(0xff000000),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color(0xff000000),
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryMaterialColor)
      .copyWith(secondary: const Color(0xff000000)),
  iconTheme: const IconThemeData(color: Colors.white),
);
