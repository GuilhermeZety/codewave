import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:codewave_systems/app/core/common/constants/app_colors.dart';
import 'package:codewave_systems/app/core/common/constants/app_fonts.dart';

class ContinueIndicator extends StatelessWidget {
  const ContinueIndicator({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ColoredBox(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.keyboard_double_arrow_down_rounded)
                .animate(onComplete: (_) => _.repeat(reverse: true))
                .fade(
                  duration: 800.ms,
                  delay: 300.ms,
                )
                .slideY(duration: 800.ms, begin: -0.2, end: 0.2),
            const Gap(16),
            const Text(
              'Continue',
              style: TextStyle(
                fontSize: 16,
                fontWeight: AppFonts.bold,
                color: AppColors.grey_600,
              ),
            ).animate(onComplete: (_) => _.repeat(reverse: true)).fade(
                  duration: 800.ms,
                  delay: 300.ms,
                ),
            const Gap(16),
            const Icon(Icons.keyboard_double_arrow_down_rounded)
                .animate(onComplete: (_) => _.repeat(reverse: true))
                .fade(
                  duration: 800.ms,
                  delay: 300.ms,
                )
                .slideY(duration: 800.ms, begin: -0.2, end: 0.2),
          ],
        ),
      ),
    );
  }
}
