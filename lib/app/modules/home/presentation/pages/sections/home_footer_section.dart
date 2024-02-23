import 'dart:developer';

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
import 'package:landing_page/app/ui/components/social_media.dart';
import 'package:landing_page/main.dart';

class HomeFooterSection extends StatefulWidget {
  const HomeFooterSection({
    super.key,
  });
  @override
  State<HomeFooterSection> createState() => _HomeFooterSectionState();
}

class _HomeFooterSectionState extends State<HomeFooterSection> {
  String titleText = appTexts.apresentationTitle;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -60,
          child: SvgPicture.asset(
            AppSvgs.waterLayer_3,
            width: context.width,
          )
              .animate(
                onComplete: (controller) => controller.repeat(reverse: true),
              )
              .slideY(begin: -0.1, end: 0.1, duration: 2.seconds)
              .animate(
                onComplete: (controller) => controller.repeat(reverse: true),
              )
              .rotate(begin: -0.008, end: 0.008, duration: 3.seconds),
        ),
        Positioned(
          bottom: -80,
          child: SvgPicture.asset(
            AppSvgs.waterLayer_2,
            width: context.width,
          )
              .animate(
                onComplete: (controller) => controller.repeat(reverse: true),
              )
              .slideY(begin: -0.08, end: 0.08, duration: 1.8.seconds)
              .animate(
                onComplete: (controller) => controller.repeat(reverse: true),
              )
              .rotate(begin: 0.008, end: -0.008, duration: 3.seconds),
        ),
        Positioned(
          bottom: -120,
          child: SvgPicture.asset(
            AppSvgs.waterLayer_1,
            width: context.width,
          )
              .animate(
                onComplete: (controller) => controller.repeat(reverse: true),
              )
              .slideY(begin: -0.08, end: 0.1, duration: 2.2.seconds)
              .animate(
                onComplete: (controller) => controller.repeat(reverse: true),
              )
              .rotate(begin: 0.005, end: -0.005, duration: 3.seconds),
        ),
        Center(
          child: _mainContent,
        ),
      ],
    );
  }

  Widget get _mainContent {
    return Container(
      color: AppColors.grey_200,
      width: context.width,
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: context.width,
                constraints: const BoxConstraints(
                  maxWidth: maxWidthDesign,
                ),
                child: Builder(
                  builder: (context) {
                    List<Widget> widgets = [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.longLogo,
                            height: 35,
                          ),
                          const Gap(24),
                          const Text('Criando o próximo nível de experiência\ne envolvimento do usuário.'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'QUEM SOMOS',
                            style: TextStyle(
                              fontWeight: AppFonts.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Gap(24),
                          FooterItem(
                            text: 'O que fazemos',
                            offset: context.height - 300,
                            mobileOffset: context.height,
                          ),
                          const Gap(12),
                          FooterItem(
                            text: 'Valores',
                            offset: context.height + 300,
                            mobileOffset: context.height * 2,
                          ),
                          const Gap(12),
                          FooterItem(
                            text: 'Sobre Nós',
                            offset: context.height + 1300,
                            mobileOffset: context.height * 3 + 700,
                          ),
                          const Gap(12),
                          FooterItem(
                            text: 'Fluxo de Projetos',
                            offset: context.height + 2300,
                            mobileOffset: context.height * 4 + 900,
                          ),
                          const Gap(12),
                          FooterItem(
                            text: 'Suporte',
                            offset: context.height + 3100,
                            mobileOffset: context.height * 5 + 800,
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EMPRESA',
                            style: TextStyle(
                              fontWeight: AppFonts.bold,
                              fontSize: 16,
                            ),
                          ),
                          Gap(24),
                          Text(
                            'Privacidade',
                            style: TextStyle(
                              fontWeight: AppFonts.normal,
                              color: AppColors.grey_400,
                            ),
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SIGA-NOS',
                            style: TextStyle(
                              fontWeight: AppFonts.bold,
                              fontSize: 16,
                            ),
                          ),
                          Gap(24),
                          SocialMedia(width: 110),
                        ],
                      ),
                    ];
                    if (context.isTablet) {
                      return Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 24,
                        runSpacing: 24,
                        children: widgets,
                      );
                    }
                    if (context.isMobile) {
                      return Column(
                        children: [
                          widgets.first,
                          const Gap(20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widgets[1],
                              const Gap(40),
                              widgets[2],
                            ],
                          ),
                          widgets[3],
                        ],
                      );
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: widgets,
                    ).pH(24);
                  },
                ),
              ),
            ],
          ),
          const Gap(12),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '© CodeWave System 2024. Todos os direitos reservados.',
                style: TextStyle(
                  color: AppColors.grey_400,
                ),
              ),
            ],
          ).pV(24),
        ],
      ),
    ).animate().fade().slideY(begin: 0.2, end: 0.0);
  }
}

class FooterItem extends StatefulWidget {
  const FooterItem({super.key, required this.text, required this.offset, required this.mobileOffset});

  final String text;
  final double offset;
  final double mobileOffset;

  @override
  State<FooterItem> createState() => _FooterItemState();
}

class _FooterItemState extends State<FooterItem> {
  Color color = AppColors.grey_400;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        log('enter');
        color = AppColors.primary;
        if (mounted) setState(() {});
      },
      onExit: (_) {
        color = AppColors.grey_400;
        if (mounted) setState(() {});
      },
      child: GestureDetector(
        onTap: () {
          homeScrollController.animateTo(
            context.isMobile ? widget.mobileOffset : widget.offset,
            duration: 500.ms,
            curve: Curves.easeInCirc,
          );
        },
        child: Text(
          widget.text,
          style: TextStyle(
            fontWeight: AppFonts.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
