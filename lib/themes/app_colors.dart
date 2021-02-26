import 'dart:ui';

class AppColors {
  static final HexColor primary1 = HexColor('#FB6D3B');
  static final HexColor primary2 = HexColor('##FC9631');
  static final HexColor primary3 = HexColor('##FFF1E5');
  static final HexColor neutral1 = HexColor('#4F585E');
  static final HexColor neutral2 = HexColor('#697586');
  static final HexColor neutral3 = HexColor('#9B9B9B');
  static final HexColor neutral4 = HexColor('#C3C3C3');
  static final HexColor neutral5 = HexColor('#F6F6F6');
  static final HexColor semantic1 = HexColor('#3ABC5E');
  static final HexColor semantic2 = HexColor('#F43E3E');
  static final HexColor semantic3 = HexColor('#4B8EDD');
  static final HexColor white = HexColor('#FFFFFF');
  static final HexColor black = HexColor('#000000');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
