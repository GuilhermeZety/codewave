import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/extensions/context_extension.dart';

class Decoration2 extends StatelessWidget {
  const Decoration2({super.key, required this.offset});
  final double offset;

  @override
  Widget build(BuildContext context) {
    double getMarginWidth = (context.width - 1152) < 0 ? 0 : (context.width - 1152) / 2;
    return Positioned(
      top: (context.height / 4) > 300 ? 300 : context.height / 4 - (offset * 1.2),
      right: getMarginWidth - 200,
      child: Column(
        children: [
          SizedBox(
            width: (context.width / 1.5) > 900 ? 900 : context.width / 1.5,
            child: Image.asset(
              AppAssets.images.macFrame,
            ),
          ).animate().fade(duration: 300.ms).slideY(begin: 0.1, end: 0.0, duration: 300.ms),
        ],
      ),
    );
  }
}
