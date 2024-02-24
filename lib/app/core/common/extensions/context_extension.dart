import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:codewave_systems/app/core/common/enums/layout_type.dart';

extension GetTheme on BuildContext {
  Size get _size => MediaQuery.sizeOf(this);

  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isMobile => _size.width < 600;
  bool get isNotDesktop => _size.width < 900;
  bool get isTablet => _size.width >= 600 && _size.width < 900;
  bool get isDesktop => _size.width >= 900;

  LayoutTypes get layout => isMobile
      ? LayoutTypes.mobile
      : isTablet
          ? LayoutTypes.tablet
          : LayoutTypes.desktop;

  double get scale {
    if (isDesktop) {
      return 1.40;
    } else if (isTablet) {
      return 1.25;
    } else {
      return 1;
    }
  }

  double get pixelsPerInch => Platform.isAndroid || Platform.isIOS ? 150 : 96;

  /// Returns same as MediaQuery.of(context)
  MediaQueryData get mq => MediaQuery.of(this);

  double safeArea(AxisDirection direction) {
    var pd = MediaQuery.paddingOf(this);
    return switch (direction) {
      (AxisDirection.up) => pd.top,
      (AxisDirection.right) => pd.right,
      (AxisDirection.down) => pd.bottom,
      (AxisDirection.left) => pd.left,
    };
  }

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  Size get sizePx => mq.size;

  /// Returns same as MediaQuery.of(context).size.width
  double get width => sizePx.width;

  /// Returns same as MediaQuery.of(context).height
  double get height => sizePx.height;

  /// Returns diagonal screen pixels
  double get diagonalPx {
    final Size s = sizePx;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Returns pixel size in Inches
  Size get sizeInches {
    final Size pxSize = sizePx;
    return Size(pxSize.width / pixelsPerInch, pxSize.height / pixelsPerInch);
  }

  /// Returns screen width in Inches
  double get widthInches => sizeInches.width;

  /// Returns screen height in Inches
  double get heightInches => sizeInches.height;

  /// Returns screen diagonal in Inches
  double get diagonalInches => diagonalPx / pixelsPerInch;

  /// Returns fraction (0-1) of screen width in pixels
  double widthPct(double fraction) => fraction * width;

  /// Returns fraction (0-1) of screen height in pixels
  double heightPct(double fraction) => fraction * height;
}

extension KeyboardExtension on BuildContext {
  bool get isKeyboardOpen => MediaQuery.viewInsetsOf(this).bottom > 0;
  double get bottomHeight => MediaQuery.viewInsetsOf(this).bottom;
}
