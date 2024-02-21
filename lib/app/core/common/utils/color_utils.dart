import 'package:flutter/material.dart';

class ColorUtils {
  static Color colorFromHex(String hex) {
    var hexColor = hex;
    if (hex.contains('#')) {
      hexColor = hex.replaceAll('#', '');
    }

    return Color(int.parse(hexColor, radix: 16) + 0xFF000000);
  }
}
