import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray700 = fromHex('#666666');

  static Color indigo100 = fromHex('#c5cdf7');

  static Color gray500 = fromHex('#9f9f9f');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color green900 = fromHex('#064d00');

  static Color blueGray900 = fromHex('#363636');

  static Color black90019 = fromHex('#19000000');

  static Color black9003f = fromHex('#3f000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color blue70019 = fromHex('#190157e4');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
