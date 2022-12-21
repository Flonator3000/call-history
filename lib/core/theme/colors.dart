import 'package:flutter/material.dart';

class AppColors {
  static const backgroundColor = Colors.white;

  static MaterialColor primary = MaterialColor(
    Colors.purple.value,
    const <int, Color>{
      50: Color.fromRGBO(230, 230, 250, 0.1),
      100: Color.fromRGBO(230, 230, 250, 0.2),
      200: Color.fromRGBO(230, 230, 250, 0.3),
      300: Color.fromRGBO(230, 230, 250, 0.4),
      400: Color.fromRGBO(230, 230, 250, 0.5),
      500: Color.fromRGBO(230, 230, 250, 0.6),
      600: Color.fromRGBO(230, 230, 250, 0.7),
      700: Color.fromRGBO(230, 230, 250, 0.8),
      800: Color.fromRGBO(230, 230, 250, 0.9),
      900: Color.fromRGBO(230, 230, 250, 1),
    },
  );

  static MaterialColor secondary = MaterialColor(
    Colors.orange.value,
    const <int, Color>{
      50: Color.fromRGBO(255, 165, 0, 0.1),
      100: Color.fromRGBO(255, 165, 0, 0.6),
      200: Color.fromRGBO(255, 165, 0, 0.3),
      300: Color.fromRGBO(255, 165, 0, 0.4),
      400: Color.fromRGBO(255, 165, 0, 0.5),
      500: Color.fromRGBO(255, 165, 0, 0.6),
      600: Color.fromRGBO(255, 165, 0, 0.7),
      700: Color.fromRGBO(255, 165, 0, 0.8),
      800: Color.fromRGBO(255, 165, 0, 0.9),
      900: Color.fromRGBO(255, 165, 0, 1),
    },
  );

  static const hintTextStyle = Color.fromRGBO(0, 0, 0, 0.6);
  static const mainTextColor = Colors.black;
  static const inputBorderColor = Colors.amber;
}
