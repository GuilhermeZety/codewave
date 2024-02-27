import 'dart:developer';

import 'package:codewave_systems/app/core/common/constants/app_colors.dart';
import 'package:codewave_systems/app/core/common/constants/app_fonts.dart';
import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';
import 'package:codewave_systems/app/core/common/extensions/widget_extension.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:codewave_systems/app/core/shared/app_sections_size.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/home_page.dart';
import 'package:codewave_systems/app/ui/components/social_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeFooterSection extends StatefulWidget {
  const HomeFooterSection({
    super.key,
  });
  @override
  State<HomeFooterSection> createState() => _HomeFooterSectionState();
}

class _HomeFooterSectionState extends State<HomeFooterSection> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -60,
          child: SvgPicture.memory(
            AppCache.water_layer_3,
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
          child: SvgPicture.memory(
            AppCache.water_layer_2,
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
          child: SvgPicture.memory(
            AppCache.water_layer_1,
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
                          Image.memory(
                            AppCache.longLogo,
                            height: 35,
                          ),
                          const Gap(24),
                          const Text(
                            'Criando o próximo nível de experiência\ne envolvimento do usuário.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: AppFonts.normal,
                              color: AppColors.grey_400,
                            ),
                          ),
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
                            offset: AppSectionSizes.getWhatWeDoOffset(context),
                          ),
                          const Gap(12),
                          FooterItem(
                            text: 'Valores',
                            offset: AppSectionSizes.getOurValuesOffset(context),
                          ),
                          const Gap(12),
                          FooterItem(
                            text: 'Sobre Nós',
                            offset: AppSectionSizes.getAboutUsOffset(context),
                          ),
                          const Gap(12),
                          FooterItem(
                            text: 'Fluxo de Projetos',
                            offset: AppSectionSizes.getProjectFlowOffset(context),
                          ),
                          const Gap(12),
                          FooterItem(
                            text: 'Suporte',
                            offset: AppSectionSizes.getContactOffset(context),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '© CodeWave System 2024. Todos os direitos reservados.',
                style: TextStyle(
                  color: AppColors.grey_400,
                ),
                textAlign: TextAlign.center,
              ).expanded(),
            ],
          ).p(24),
        ],
      ),
    );
  }
}

class FooterItem extends StatefulWidget {
  const FooterItem({super.key, required this.text, required this.offset});

  final String text;
  final double offset;

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
            widget.offset,
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
