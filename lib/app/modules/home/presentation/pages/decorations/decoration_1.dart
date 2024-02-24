import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/home_page.dart';

class Decoration1 extends StatelessWidget {
  const Decoration1({super.key, required this.offset});

  final double offset;

  @override
  Widget build(BuildContext context) {
    double getMarginWidth = (context.width - 1152) < 0 ? 0 : (context.width - 1152) / 2;
    return Positioned(
      top: 0 - (homeScrollController.positions.isEmpty ? 0 : homeScrollController.offset) - offset,
      right: getMarginWidth - 210,
      child: SvgPicture.memory(
        AppCache.decoration_1,
      ).animate().fade(duration: 500.ms).slideX(begin: 0.2, end: 0.0, duration: 300.ms).slideY(begin: -0.2, end: 0.0, duration: 300.ms),
    );
  }
}
