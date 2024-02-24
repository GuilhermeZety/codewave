import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:codewave_systems/app/core/common/constants/app_colors.dart';

extension Expanding on Widget {
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget expandedH({int flex = 1}) => Row(children: [Expanded(flex: flex, child: this)]);
}

extension Heroic on Widget {
  Widget hero(String? tag) => tag != null
      ? Hero(
          tag: tag,
          child: this,
        )
      : this;
}

extension Shimmer on Widget {
  Widget shim(bool isShimmer) => isShimmer
      ? animate(onPlay: (controller) => controller.repeat()).shimmer(
          duration: 3.seconds,
          color: AppColors.white,
          delay: 2.seconds,
        )
      : this;
}

extension Paddings on Widget {
  Widget p(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );
  Widget pV(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );
  Widget pH(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );
  Widget pVH(double paddingV, double paddingH) => Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        child: this,
      );
  Widget pTop(double padding) => Padding(
        padding: EdgeInsets.only(top: padding),
        child: this,
      );
  Widget pLeft(double padding) => Padding(
        padding: EdgeInsets.only(left: padding),
        child: this,
      );
  Widget pRight(double padding) => Padding(
        padding: EdgeInsets.only(right: padding),
        child: this,
      );
  Widget pBottom(double padding) => Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: this,
      );
}
