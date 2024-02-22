import 'package:auto_size_text/auto_size_text.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  String titleText = '';
  List<String> texts = [];

  @override
  void initState() {
    titleText = config.getString('WHAT_WE_DO_TITLE');
    texts.add(config.getString('WHAT_WE_DO_TEXT_1'));
    texts.add(config.getString('WHAT_WE_DO_TEXT_2'));
    texts.add(config.getString('WHAT_WE_DO_TEXT_3'));
    texts.add(config.getString('WHAT_WE_DO_TEXT_4'));
    if (mounted) setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      child: Center(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 1000,
              ),
              child: LayoutBuilder(
                builder: (context, contraints) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SvgPicture.asset(
                          AppAssets.svgs.decoration_4,
                          width: 700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _mainContent.pTop(60),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _mainContent {
    return SeparatedColumn(
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
              item(
                true,
                true,
                texts[0],
              ),
              item(
                true,
                false,
                texts[1],
              ),
              item(
                true,
                true,
                texts[2],
              ),
              item(
                false,
                false,
                texts[3],
              ),
            ],
          ),
        ),
      ],
    ).pH(24).animate().fade(duration: 400.ms).slideY(begin: 0.2, end: 0.0);
  }

  Widget item(bool withIndicator, bool right, String text) {
    double margin = 200;
    if (context.isTablet) {
      margin = 80;
    }
    if (context.isMobile) {
      margin = 30;
    }
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
