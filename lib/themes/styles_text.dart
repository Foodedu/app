import 'package:flutter/material.dart';

class FontFamily {
  static const String appFont = 'AvenirNextLTPro';
}

class StylesText {
  static const largeTitle = TextStyle(
    fontSize: 40,
    fontFamily: FontFamily.appFont,
    fontWeight: FontWeight.w700,
  );
  static const title1 = TextStyle(
    fontSize: 27,
    fontFamily: FontFamily.appFont,
    fontWeight: FontWeight.w600,
  );

  static const title2 = TextStyle(
      fontSize: 20,
      fontFamily: FontFamily.appFont,
      fontWeight: FontWeight.w600,
      color: Colors.black);
  static const h1 = TextStyle(
    fontSize: 20,
    fontFamily: FontFamily.appFont,
    fontWeight: FontWeight.w700,
  );
  static const h2 = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.appFont,
    fontWeight: FontWeight.w600,
  );
  static const body1 = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.appFont,
    fontWeight: FontWeight.w500,
  );
  static const body2 = TextStyle(
    fontSize: 15,
    fontFamily: FontFamily.appFont,
    fontWeight: FontWeight.w700,
  );
  static const caption = TextStyle(
    fontSize: 12,
    fontFamily: FontFamily.appFont,
    fontWeight: FontWeight.w700,
  );
}
