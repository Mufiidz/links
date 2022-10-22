import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  static Color navyBlue = HexColor('0468D7');
  static Color navyBlueShadow = HexColor('2F80ED');
  static MaterialColor primary = MaterialColor(
    navyBlue.value,
    const <int, Color>{
      50: Color.fromRGBO(4, 104, 215, 0.1),
      100: Color.fromRGBO(4, 104, 215, 0.2),
      200: Color.fromRGBO(4, 104, 215, 0.3),
      300: Color.fromRGBO(4, 104, 215, 0.4),
      400: Color.fromRGBO(4, 104, 215, 0.5),
      500: Color.fromRGBO(4, 104, 215, 0.6),
      600: Color.fromRGBO(4, 104, 215, 0.7),
      700: Color.fromRGBO(4, 104, 215, 0.6),
      800: Color.fromRGBO(4, 104, 215, 0.8),
      900: Color.fromRGBO(4, 104, 215, 0.9),
    },
  );
}

class HexColor extends Color {
  HexColor(String hexColor) : super(getColorFromHex(hexColor));

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }

    return int.parse(hexColor, radix: 16);
  }
}