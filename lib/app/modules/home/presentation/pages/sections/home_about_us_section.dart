import 'package:auto_size_text/auto_size_text.dart';
import 'package:codewave_systems/app/core/common/constants/app_colors.dart';
import 'package:codewave_systems/app/core/common/constants/app_fonts.dart';
import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';
import 'package:codewave_systems/app/core/common/extensions/widget_extension.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:codewave_systems/app/core/shared/controller/app_texts.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/home_page.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeAboutUsSection extends StatefulWidget {
  const HomeAboutUsSection({
    super.key,
  });
  @override
  State<HomeAboutUsSection> createState() => _HomeAboutUsSectionState();
}

class _HomeAboutUsSectionState extends State<HomeAboutUsSection> {
  final String titleText = AppTexts.aboutUsTitle;
  final String subtitle = AppTexts.aboutUsSubtitle;
  final List<String> texts = [
    AppTexts.aboutUsText1,
    AppTexts.aboutUsText2,
    AppTexts.aboutUsText3,
    AppTexts.aboutUsText4,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (context.width < 2000)
              SizedBox(
                width: context.width,
                child: SvgPicture.memory(
                  AppCache.decoration_5,
                  width: 2000,
                  fit: BoxFit.cover,
                ),
              )
            else
              Container(
                height: 300,
                width: context.width,
                color: AppColors.primary.withOpacity(0.5),
                alignment: Alignment.topCenter,
                child: Container(
                  height: 270,
                  color: AppColors.primary,
                  width: context.width,
                ),
              ).pTop(300),
          ],
        ).pTop(context.isNotDesktop ? 150 : 100),
        Row(
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
      ],
    );
  }

  Widget get _mainContent {
    bool isNotDesktop = context.isNotDesktop;
    return SeparatedColumn(
      separatorBuilder: () => const Gap(24),
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Sobre Nós',
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
        const Gap(60),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: AutoSizeText(
            subtitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: AppFonts.bold,
              color: AppColors.primary,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ).expandedH(),
        ),
        Container(
          width: context.width,
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isNotDesktop)
                SvgPicture.memory(
                  AppCache.team,
                  width: 430,
                ),
              const Gap(12),
              Builder(
                builder: (context) {
                  Widget w = SeparatedColumn(
                    separatorBuilder: () => const Gap(24),
                    children: [
                      AboutUsBubble(text: texts[0]),
                      AboutUsBubble(text: texts[0]),
                      AboutUsBubble(text: texts[0]),
                      AboutUsBubble(text: texts[0]),
                      // bubble(texts[1]).pLeft(isNotDesktop ? 0 : 30),
                      // bubble(texts[2]).pLeft(isNotDesktop ? 0 : 30),
                      // bubble(texts[3]).pLeft(0),
                    ],
                  );

                  if (!isNotDesktop) {
                    return w.expanded();
                  }

                  return w;
                },
              ),
            ],
          ),
        ),
        if (context.isNotDesktop) const Gap(20),
      ],
    ).animate().fade(duration: 400.ms).slideY(begin: 0.2, end: 0.0);
  }
}

class AboutUsBubble extends StatelessWidget {
  const AboutUsBubble({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    if (context.isNotDesktop) {
      return Container(
        width: context.width - 26,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: const EdgeInsets.all(12),
        child: AutoSizeText(
          text,
          style: const TextStyle(color: AppColors.grey_500),
          maxLines: 6,
          textAlign: TextAlign.center,
          minFontSize: 10,
        ),
      );
    }
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
      backGroundColor: AppColors.white,
      padding: const EdgeInsets.all(12),
      elevation: 0,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: context.width * 0.7,
        ),
        child: Text(
          text,
          style: const TextStyle(color: AppColors.grey_500),
        ).pH(24),
      ),
    );
  }
}
