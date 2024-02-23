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
import 'package:landing_page/app/ui/components/button.dart';
import 'package:landing_page/app/ui/components/input.dart';

class HomeContactSection extends StatefulWidget {
  const HomeContactSection({
    super.key,
  });
  @override
  State<HomeContactSection> createState() => _HomeContactSectionState();
}

class _HomeContactSectionState extends State<HomeContactSection> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -(context.width * 0.01),
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
          bottom: -(context.width * 0.02),
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
          bottom: -(context.width * 0.03),
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

  Future _sendContact() async {}

  Widget get _mainContent {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 1100,
      ),
      width: context.width,
      child: SeparatedColumn(
        separatorBuilder: () => const Gap(24),
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AutoSizeText(
            'Contato',
            style: TextStyle(
              fontSize: 42,
              fontWeight: AppFonts.bold,
              color: AppColors.grey_600,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ).expandedH(),
          const Gap(40),
          Row(
            children: [
              Container(
                width: context.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(32),
                child: Builder(
                  builder: (context) {
                    List<Widget> widgets = [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Dados de Contato',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: AppFonts.bold,
                              color: AppColors.grey_700,
                            ),
                          ),
                          const Divider(
                            color: AppColors.grey_200,
                          ),
                          const Gap(10),
                          Input.numeric(
                            emailController,
                            label: 'Email:',
                            onChange: (p0) {
                              if (mounted) setState(() {});
                            },
                            hint: 'Insira o seu email para contato futuro',
                          ).expandedH(),
                          const Gap(8),
                          Input.numeric(
                            nameController,
                            label: 'Nome:',
                            onChange: (p0) {
                              if (mounted) setState(() {});
                            },
                            hint: 'Insira o seu nome :)',
                          ).expandedH(),
                          const Gap(8),
                          Input.numeric(
                            descriptionController,
                            label: 'Motivo do contato:',
                            onChange: (p0) {
                              if (mounted) setState(() {});
                            },
                            hint: 'Descreva aqui o motivo do contato',
                            maxLines: 5,
                            minLines: 5,
                          ).expandedH(),
                          const Gap(16),
                          Button(
                            onPressed: _sendContact,
                            disabled: nameController.text.isEmpty || emailController.text.isEmpty || descriptionController.text.isEmpty,
                            child: const Text('Enviar'),
                          ).expandedH(),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Estamos ansiosos para ouvir de você!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: AppFonts.bold,
                              color: AppColors.grey_700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Gap(24),
                          Builder(
                            builder: (context) {
                              String text =
                                  'Se você tiver alguma dúvida, feedback ou estiver interessado em nossos serviços, por favor, preencha o formulário ao lado.\n\nEntraremos em contato o mais breve possível para discutir como podemos ajudar a alcançar seus objetivos.';

                              if (context.isMobile) {
                                text = text.replaceAll('ao lado', 'a baixo');
                              }
                              return Text(
                                text,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: AppFonts.normal,
                                  color: AppColors.grey_500,
                                ),
                                textAlign: TextAlign.center,
                              );
                            },
                          ),
                        ],
                      ),
                    ];
                    if (context.isMobile) {
                      widgets = [
                        widgets.first,
                        const Gap(24),
                        widgets.last,
                      ];
                      return Column(
                        children: widgets.reversed.toList(),
                      );
                    }
                    widgets = [
                      widgets.first.expanded(),
                      const Gap(24),
                      widgets.last.expanded(),
                    ];
                    return Row(
                      children: widgets,
                    );
                  },
                ),
              ).expanded(),
            ],
          ).pBottom(40),
        ],
      ).pH(24),
    ).animate().fade().slideY(begin: 0.2, end: 0.0);
  }
}
