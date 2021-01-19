import 'package:flutter/material.dart';

class AppColor {
  static Color primary = HexColor("FB6D3B");
  static Color orangeDark = HexColor("FC9631");
  static Color orangeLight = HexColor("FFF1E5");

  static Color darkGrayHighlighted = HexColor("4F585E");
  static Color darkBlueGray = HexColor("697586");
  static Color darkGray = HexColor("9B9B9B");
  static Color lightGray = HexColor("C3C3C3");
  static Color offWhite = HexColor("F6F6F6");
  static Color white = Colors.white;

  static Color green = HexColor("3ABC5E");
  static Color red = HexColor("F43E3E");
  static Color blue = HexColor("4B8EDD");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}