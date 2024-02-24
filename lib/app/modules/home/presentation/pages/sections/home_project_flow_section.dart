import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:codewave_systems/app/core/common/constants/app_colors.dart';
import 'package:codewave_systems/app/core/common/constants/app_fonts.dart';
import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';
import 'package:codewave_systems/app/core/common/extensions/widget_extension.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:codewave_systems/main.dart';

class HomeProjectFlowSection extends StatefulWidget {
  const HomeProjectFlowSection({
    super.key,
  });
  @override
  State<HomeProjectFlowSection> createState() => _HomeProjectFlowSectionState();
}

class _HomeProjectFlowSectionState extends State<HomeProjectFlowSection> {
  String titleText = appTexts.apresentationTitle;
  List<Map<String, dynamic>> listCarroussel = [
    {
      'number': '1',
      'title': appTexts.projectFlowCardTitle1,
      'text': appTexts.projectFlowCardText1,
    },
    {
      'number': '2',
      'title': appTexts.projectFlowCardTitle2,
      'text': appTexts.projectFlowCardText2,
    },
    {
      'number': '3',
      'title': appTexts.projectFlowCardTitle3,
      'text': appTexts.projectFlowCardText3,
    },
    {
      'number': '4',
      'title': appTexts.projectFlowCardTitle4,
      'text': appTexts.projectFlowCardText4,
    },
    {
      'number': '5',
      'title': appTexts.projectFlowCardTitle5,
      'text': appTexts.projectFlowCardText5,
    },
    {
      'number': '6',
      'title': appTexts.projectFlowCardTitle6,
      'text': appTexts.projectFlowCardText6,
    },
    {
      'number': '7',
      'title': appTexts.projectFlowCardTitle7,
      'text': appTexts.projectFlowCardText7,
    },
    {
      'number': '8',
      'title': appTexts.projectFlowCardTitle8,
      'text': appTexts.projectFlowCardText8,
    },
  ];
  CarouselController carouselController = CarouselController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _mainContent,
    );
  }

  Widget get _mainContent {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 670,
      ),
      width: context.width,
      child: SeparatedColumn(
        separatorBuilder: () => const Gap(24),
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Fluxo de Projetos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: AppFonts.semiBold,
              color: AppColors.blue_400,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          AutoSizeText(
            titleText,
            style: const TextStyle(
              fontSize: 42,
              fontWeight: AppFonts.bold,
              color: AppColors.grey_600,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ).expandedH(),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.memory(AppCache.decoration_6).pTop(280),
              ),
              GestureDetector(
                onTap: () {
                  carouselController.nextPage();
                },
                child: Container(
                  color: Colors.transparent,
                  height: 420,
                  width: 600,
                  child: CarouselSlider(
                    items: carrousselImages,
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      aspectRatio: 2.0,
                      viewportFraction: 0.3,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.4,
                      autoPlayInterval: 4.seconds,
                      scrollDirection: Axis.vertical,
                      autoPlay: true,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        carouselController.nextPage();
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: const Icon(Icons.keyboard_double_arrow_down_rounded, color: AppColors.white, size: 40)
                            .animate(onComplete: (_) => _.repeat(reverse: true))
                            .fade(
                              duration: 800.ms,
                              begin: 0.3,
                              end: 1.0,
                            )
                            .slideY(duration: 800.ms, begin: -0.2, end: 0.2),
                      ),
                    ),
                  ],
                ).pTop(400),
              ),
            ],
          ),
        ],
      ).pH(24),
    ).animate().fade().slideY(begin: 0.2, end: 0.0);
  }

  List<Widget> get carrousselImages => listCarroussel
      .map(
        (item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: FlowItem(
            number: item['number'],
            title: item['title'],
            text: item['text'],
          ),
        ),
      )
      .toList();
}

class FlowItem extends StatelessWidget {
  const FlowItem({super.key, required this.number, required this.title, required this.text});

  final String number;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      // color: Colors.red,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 0,
            bottom: 0,
            left: 10,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Column(
                  children: [
                    AutoSizeText(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: AppFonts.bold,
                        color: AppColors.grey_800,
                      ),
                      maxLines: 1,
                    ),
                    const Gap(12),
                    AutoSizeText(
                      text,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: AppFonts.normal,
                        color: AppColors.grey_400,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ).expanded(),
                  ],
                ).pV(12).pLeft(60).pRight(24),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.5),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: AppFonts.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
