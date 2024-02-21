import 'package:flutter/material.dart';
import 'package:landing_page/app/core/common/enums/layout_type.dart';

extension GetTheme on BoxConstraints {
  bool get isMobile => maxWidth < 600;
  bool get isTablet => maxWidth >= 600 && maxWidth < 900;
  bool get isDesktop => maxWidth >= 900;

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
}
