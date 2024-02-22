import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/extensions/context_extension.dart';

class Decoration3 extends StatelessWidget {
  const Decoration3({super.key, required this.offset});
  final double offset;

  @override
  Widget build(BuildContext context) {
    double getMarginWidth = (context.width - 1152) < 0 ? 0 : (context.width - 1152) / 2;
    return Positioned(
      top: (context.height / 4) > 300 ? 300 : context.height / 4 - (offset * 0.5),
      left: -270 + ((getMarginWidth > 125) ? 125 : getMarginWidth),
      child: Column(
        children: [
          SvgPicture.asset(
            AppAssets.svgs.decoration_2,
            width: 250,
            height: 250,
          ).animate().fade(),
        ],
      ),
    );
  }
}
