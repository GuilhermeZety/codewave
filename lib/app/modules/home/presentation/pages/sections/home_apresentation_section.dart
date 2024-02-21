import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/constants/app_colors.dart';
import 'package:landing_page/app/core/common/constants/app_fonts.dart';
import 'package:landing_page/app/core/common/extensions/context_extension.dart';
import 'package:landing_page/app/core/common/extensions/widget_extension.dart';
import 'package:landing_page/app/ui/components/button.dart';
import 'package:landing_page/app/ui/components/continue_indicator.dart';
import 'package:landing_page/app/ui/components/social_media.dart';

class HomeApresentationSection extends StatefulWidget {
  const HomeApresentationSection({super.key, required this.maxWidth});
  final double maxWidth;
  @override
  State<HomeApresentationSection> createState() => _HomeApresentationSectionState();
}

class _HomeApresentationSectionState extends State<HomeApresentationSection> {
  double get getMarginWidth => (context.width - widget.maxWidth) < 0 ? 0 : (context.width - widget.maxWidth) / 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              if (!(context.isMobile || context.isTablet)) _decoration1,
              if (!(context.isMobile || context.isTablet)) _decoration2,
              _appBar,
              Center(
                child: Row(
                  mainAxisAlignment: context.isMobile || context.isTablet ? MainAxisAlignment.center : MainAxisAlignment.start,
                  children: [
                    _mainContent.pLeft(getMarginWidth),
                    if ((!context.isMobile && !context.isTablet))
                      SizedBox(
                        width: context.width / 2,
                        height: context.height / 1.5,
                        child: Image.asset(
                          AppAssets.images.macFrame,
                        ),
                      ).animate().fade(),
                  ],
                ),
              ),
              Positioned(
                bottom: 24,
                left: 0,
                right: 0,
                child: ContinueIndicator(
                  onTap: () {
                    Modular.get<ScrollController>().animateTo(context.height - 100, duration: 300.ms, curve: Curves.easeInBack);
                  },
                ),
              ),
            ],
          );
        },
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
                : 400,
      ),
      width: context.width,
      child: SeparatedColumn(
        separatorBuilder: () => const Gap(24),
        crossAxisAlignment: isNotDesktop ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectableText(
            'Transformando ideias\nem soluções',
            style: const TextStyle(
              fontSize: 46,
              fontWeight: AppFonts.bold,
              color: AppColors.grey_600,
            ),
            textAlign: isNotDesktop ? TextAlign.center : TextAlign.start,
            maxLines: 2,
          ).expandedH(),
          SelectableText(
            'Surfe na Onda da Tecnologia com a CodeWave Systems',
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
                child: const Text('Eu Quero Uma Solução!'),
              );

              if (isMobile) return button.expandedH();
              return button;
            },
          ),
          Column(
            crossAxisAlignment: isNotDesktop ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              SelectableText(
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
    ).animate().fade().slideX(begin: -0.2, end: 0.0);
  }

  Widget get _appBar => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: widget.maxWidth),
            width: context.width,
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.svgs.longLogo,
                  height: 35,
                  width: 146,
                ),
                const Spacer(),
                if (!context.isMobile) ...[
                  Button.third(
                    onPressed: () async {
                      //
                    },
                    child: const Text('Sobre'),
                  ),
                  const Gap(50),
                ],
                Button.inverted(
                  onPressed: () async {
                    //
                  },
                  child: const Text('Entre em contato'),
                ).pRight(context.isMobile || context.isTablet ? 0 : 40),
              ],
            ).pH(24),
          ).pTop(16),
        ],
      );

  Positioned get _decoration1 => Positioned(
        top: 0,
        right: getMarginWidth - 120,
        child: SvgPicture.asset(AppAssets.svgs.decoration_1).animate().fade().slideX(begin: 0.2, end: 0.0),
      );
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
