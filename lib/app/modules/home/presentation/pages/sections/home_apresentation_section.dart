import 'dart:async';
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/constants/app_colors.dart';
import 'package:landing_page/app/core/common/constants/app_fonts.dart';
import 'package:landing_page/app/core/common/extensions/context_extension.dart';
import 'package:landing_page/app/core/common/extensions/widget_extension.dart';
import 'package:landing_page/app/modules/home/presentation/pages/home_page.dart';
import 'package:landing_page/app/ui/components/button.dart';
import 'package:landing_page/app/ui/components/continue_indicator.dart';
import 'package:landing_page/app/ui/components/social_media.dart';
import 'package:landing_page/main.dart';

class HomeApresentationSection extends StatefulWidget {
  const HomeApresentationSection({
    super.key,
    required this.maxWidth,
  });
  final double maxWidth;
  @override
  State<HomeApresentationSection> createState() => _HomeApresentationSectionState();
}

class _HomeApresentationSectionState extends State<HomeApresentationSection> {
  String title1Text = '';
  String subTitle1Text = '';
  String buttonText = '';

  @override
  void initState() {
    title1Text = config.getString('TITULO_1');
    subTitle1Text = config.getString('SUBTITULO_1');
    buttonText = config.getString('BUTTON_1');
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
              height: context.height - 60,
              child: LayoutBuilder(
                builder: (context, contraints) {
                  return Stack(
                    children: [
                      Center(
                        child: Row(
                          children: [
                            _mainContent,
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 24,
                        right: 24,
                        left: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContinueIndicator(
                              onTap: () async {
                                log('1');
                                Timer(const Duration(milliseconds: 50), () {
                                  homeScrollController.animateTo(
                                    context.height - 100,
                                    curve: Curves.easeInCirc,
                                    duration: const Duration(milliseconds: 750),
                                  );
                                });
                                // await homeScrollController.animateTo(
                                //   (contraints.maxHeight - 100),
                                //   duration: const Duration(milliseconds: 5000),
                                //   curve: Curves.easeInBack,
                                // );
                              },
                            ),
                          ],
                        ),
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
    bool isMobile = context.isMobile;
    bool isTablet = context.isTablet;

    bool isNotDesktop = isMobile || isTablet;
    return Container(
      constraints: BoxConstraints(
        maxWidth: isMobile
            ? 1000
            : isTablet
                ? 700
                : 500,
      ),
      width: context.width,
      child: SeparatedColumn(
        separatorBuilder: () => const Gap(24),
        crossAxisAlignment: isNotDesktop ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            title1Text,
            style: const TextStyle(
              fontSize: 42,
              fontWeight: AppFonts.bold,
              color: AppColors.grey_600,
            ),
            maxLines: 2,
            textAlign: isNotDesktop ? TextAlign.center : TextAlign.start,
          ).expandedH(),
          AutoSizeText(
            subTitle1Text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: AppFonts.normal,
              color: AppColors.grey_400,
            ),
            textAlign: isNotDesktop ? TextAlign.center : TextAlign.start,
          ).pBottom(16).expandedH(),
          Builder(
            builder: (context) {
              var button = Button(
                onPressed: () async {
                  //TODO:
                },
                child: Text(buttonText),
              );

              if (isMobile) return button.expandedH();
              return button;
            },
          ),
          Column(
            crossAxisAlignment: isNotDesktop ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Você também nos acha nas nossas redes',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: AppFonts.normal,
                  color: AppColors.grey_400,
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              ),
              const Gap(12),
              const SocialMedia(
                width: 230,
              ),
            ],
          ),
        ],
      ).pH(24),
    ).animate().fade().slideY(begin: 0.2, end: 0.0);
  }

  Positioned get _decoration2 => Positioned(
        top: 0,
        bottom: 0,
        left: -220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.svgs.decoration_2).animate().fade().slideX(begin: -0.2, end: 0.0),
          ],
        ),
      );
}
