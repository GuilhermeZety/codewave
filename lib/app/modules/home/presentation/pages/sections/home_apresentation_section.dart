import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
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
import 'package:codewave_systems/app/ui/components/button.dart';
import 'package:codewave_systems/app/ui/components/continue_indicator.dart';
import 'package:codewave_systems/app/ui/components/social_media.dart';
import 'package:codewave_systems/main.dart';

class HomeApresentationSection extends StatefulWidget {
  const HomeApresentationSection({
    super.key,
  });
  @override
  State<HomeApresentationSection> createState() => _HomeApresentationSectionState();
}

class _HomeApresentationSectionState extends State<HomeApresentationSection> {
  String titleText = appTexts.apresentationTitle;
  String subTitleText = appTexts.apresentationSubtitle;
  String buttonText = appTexts.apresentationButton;

  List<String> texts = [
    'Android',
    'IOS',
    'Web',
    'Linux',
    'Windows',
    'MacOS',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxWidthDesign),
        child: Center(
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 1000,
                ),
                height: context.height - 60,
                child: Stack(
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
                              Timer(const Duration(milliseconds: 50), () {
                                homeScrollController.animateTo(
                                  context.height,
                                  curve: Curves.easeInCirc,
                                  duration: const Duration(milliseconds: 750),
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //   },
                // ),
              ),
            ],
          ),
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
          Column(
            children: [
              AutoSizeText(
                titleText,
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: AppFonts.bold,
                  color: AppColors.grey_600,
                ),
                maxLines: 2,
                textAlign: isNotDesktop ? TextAlign.center : TextAlign.start,
              ).expandedH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    child: AnimatedTextKit(
                      pause: const Duration(milliseconds: 200),
                      animatedTexts: texts
                          .map(
                            (e) => TypewriterAnimatedText(
                              e,
                              speed: const Duration(milliseconds: 200),
                              textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: AppFonts.normal,
                                color: AppColors.primary,
                              ),
                            ),
                          )
                          .toList(),
                      repeatForever: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
          AutoSizeText(
            subTitleText,
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
}
