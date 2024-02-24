import 'package:auto_size_text/auto_size_text.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:codewave_systems/app/core/common/constants/app_colors.dart';
import 'package:codewave_systems/app/core/common/constants/app_fonts.dart';
import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';
import 'package:codewave_systems/app/core/common/extensions/widget_extension.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/home_page.dart';
import 'package:codewave_systems/main.dart';

class HomeWhatWeDoSection extends StatefulWidget {
  const HomeWhatWeDoSection({
    super.key,
  });
  @override
  State<HomeWhatWeDoSection> createState() => _HomeWhatWeDoSectionState();
}

class _HomeWhatWeDoSectionState extends State<HomeWhatWeDoSection> {
  final String titleText = appTexts.whatWeDoTitle;
  final List<String> texts = [
    appTexts.whatWeDoText1,
    appTexts.whatWeDoText2,
    appTexts.whatWeDoText3,
    appTexts.whatWeDoText4,
  ];

  @override
  Widget build(BuildContext context) {
    double margin = 200;
    if (context.isTablet) {
      margin = 80;
    }
    if (context.isMobile) {
      margin = 30;
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidthDesign),
      child: Center(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 1000,
              ),
              child: Stack(
                children: [
                  if (!context.isMobile)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 400,
                          child: SvgPicture.memory(
                            AppCache.decoration_4,
                            height: 400,
                          ),
                        ).expanded(),
                      ],
                    ).pTop(180),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SeparatedColumn(
                        separatorBuilder: () => const Gap(24),
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'O que fazemos',
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
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 950),
                            child: Column(
                              children: [
                                ItemWWD(
                                  withIndicator: true,
                                  right: true,
                                  text: texts[0],
                                  margin: margin,
                                ),
                                ItemWWD(
                                  withIndicator: true,
                                  right: false,
                                  text: texts[1],
                                  margin: margin,
                                ),
                                ItemWWD(
                                  withIndicator: true,
                                  right: true,
                                  text: texts[2],
                                  margin: margin,
                                ),
                                ItemWWD(
                                  withIndicator: false,
                                  right: false,
                                  text: texts[3],
                                  margin: margin,
                                ),
                              ],
                            ),
                          ).pTop(20),
                        ],
                      ).pH(24).expanded(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).pTop(140);
  }
}

class ItemWWD extends StatelessWidget {
  const ItemWWD({super.key, required this.withIndicator, required this.right, required this.text, required this.margin});
  final bool withIndicator;
  final bool right;
  final String text;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (withIndicator && !right)
          SvgPicture.memory(
            AppCache.line_l,
            height: 40,
          ).pLeft(margin),
        if (!withIndicator && !right)
          SizedBox(
            width: margin + 10,
          ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: AppFonts.semiBold,
              color: AppColors.grey_500,
            ),
          ),
        ).expanded(),
        if (withIndicator && right)
          SvgPicture.memory(
            AppCache.line_r,
            height: 40,
          ).pRight(margin),
        if (!withIndicator && right)
          SizedBox(
            width: margin + 50,
          ),
      ],
    );
  }
}
