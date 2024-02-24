import 'package:auto_size_text/auto_size_text.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:codewave_systems/app/core/common/constants/app_colors.dart';
import 'package:codewave_systems/app/core/common/constants/app_fonts.dart';
import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';
import 'package:codewave_systems/app/core/common/extensions/widget_extension.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/home_page.dart';
import 'package:codewave_systems/main.dart';

class HomeOurValuesSection extends StatefulWidget {
  const HomeOurValuesSection({
    super.key,
  });
  @override
  State<HomeOurValuesSection> createState() => _HomeOurValuesSectionState();
}

class _HomeOurValuesSectionState extends State<HomeOurValuesSection> {
  final String titleText = appTexts.ourValuesTitle;
  final List<String> titles = [
    appTexts.ourValuesTextTitle1,
    appTexts.ourValuesTextTitle2,
    appTexts.ourValuesTextTitle3,
  ];
  final List<String> texts = [
    appTexts.ourValuesText1,
    appTexts.ourValuesText2,
    appTexts.ourValuesText3,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE6E9EF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: maxWidthDesign,
            ),
            child: _mainContent.pTop(60),
          ).expanded(),
        ],
      ),
    );
  }

  Widget get _mainContent {
    double width = 300;
    if (context.width < 1040 && !context.isNotDesktop) {
      width = ((context.width - 180) / 3);
    }
    return SeparatedColumn(
      separatorBuilder: () => const Gap(24),
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Nossos Valores',
          style: TextStyle(
            fontSize: 18,
            fontWeight: AppFonts.semiBold,
            color: AppColors.blue_400,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 880),
          child: AutoSizeText(
            titleText,
            style: const TextStyle(
              fontSize: 42,
              fontWeight: AppFonts.bold,
              color: AppColors.grey_600,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ).expandedH(),
        ),
        Stack(
          children: [
            if (!context.isNotDesktop) ...[
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: 170,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: 150,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
            Container(
              width: context.width,
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Builder(
                builder: (context) {
                  final List<Widget> items = [
                    ItemOur(
                      title: titles[0],
                      text: texts[0],
                      icon: const Icon(
                        Icons.chat,
                        color: AppColors.white,
                        size: 40,
                      ),
                      width: width,
                    ),
                    ItemOur(
                      title: titles[1],
                      text: texts[1],
                      icon: const Icon(
                        Icons.tips_and_updates,
                        color: AppColors.white,
                        size: 40,
                      ),
                      width: width,
                    ),
                    ItemOur(
                      title: titles[2],
                      text: texts[2],
                      icon: const Icon(
                        Icons.handshake,
                        color: AppColors.white,
                        size: 40,
                      ),
                      width: width,
                    ),
                  ];
                  if (!context.isNotDesktop) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: items,
                    );
                  }
                  if (context.isMobile) {
                    return SeparatedColumn(
                      separatorBuilder: () => const Gap(24),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: items,
                    );
                  }

                  return Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 24,
                    runSpacing: 24,
                    children: items,
                  );
                },
              ),
            ).pBottom(30).pH(30),
          ],
        ),
        const Gap(80),
      ],
    ).pH(24).animate().fade(duration: 400.ms).slideY(begin: 0.2, end: 0.0);
  }
}

class ItemOur extends StatelessWidget {
  const ItemOur({super.key, required this.title, required this.text, required this.icon, required this.width});
  final String title;
  final String text;
  final Widget icon;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 350,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: icon,
            ),
          ),
          const Gap(24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: AppFonts.semiBold,
              color: AppColors.grey_500,
            ),
          ),
          const Gap(24),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: AppFonts.normal,
              color: AppColors.grey_500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).shim(!context.isNotDesktop);
  }
}
