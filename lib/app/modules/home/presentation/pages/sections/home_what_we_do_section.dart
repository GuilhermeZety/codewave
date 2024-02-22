import 'package:auto_size_text/auto_size_text.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/constants/app_colors.dart';
import 'package:landing_page/app/core/common/constants/app_fonts.dart';
import 'package:landing_page/app/core/common/extensions/context_extension.dart';
import 'package:landing_page/app/core/common/extensions/widget_extension.dart';
import 'package:landing_page/main.dart';

class HomeWhatWeDoSection extends StatefulWidget {
  const HomeWhatWeDoSection({
    super.key,
    required this.maxWidth,
  });
  final double maxWidth;
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
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      child: Center(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 1000,
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 400,
                        child: SvgPicture.asset(
                          AppAssets.svgs.decoration_4,
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
                          ),
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
          Container(
            width: 50,
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: AppColors.grey_500,
                ),
                left: BorderSide(
                  width: 1,
                  color: AppColors.grey_500,
                ),
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
            ),
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
            boxShadow: [
              BoxShadow(
                color: AppColors.grey_500.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 20,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: AppFonts.semiBold,
              color: AppColors.grey_500,
            ),
          ),
        ).expanded(),
        if (withIndicator && right)
          Container(
            width: 50,
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: AppColors.grey_500,
                ),
                right: BorderSide(
                  width: 1,
                  color: AppColors.grey_500,
                ),
              ),
              borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
            ),
          ).pRight(margin),
        if (!withIndicator && right)
          SizedBox(
            width: margin + 50,
          ),
      ],
    );
  }
}
