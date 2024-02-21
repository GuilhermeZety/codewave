import 'package:flutter/material.dart';

extension ToMaterialStateProperty on Color {
  /// `MaterialStateProperty.all<Color?>(this)`
  ///
  /// The `this` keyword is a special keyword in Dart that refers to the current instance of the class.
  /// In this case, the current instance of the class is the `Color` class
  ///
  /// Returns:
  ///   A MaterialStateProperty<Color?>
  MaterialStateProperty<Color?>? toMaterialStateProperty() {
    return MaterialStateProperty.all<Color?>(this);
  }
}

extension ToMaterialColor on Color {
  /// It takes a color and returns a MaterialColor with 10 shades of that color
  ///
  /// Returns:
  ///   A MaterialColor object.
  MaterialColor toMaterialColor() {
    final color = this;

    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
