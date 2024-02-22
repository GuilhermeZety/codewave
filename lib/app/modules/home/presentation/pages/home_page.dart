import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/constants/app_colors.dart';
import 'package:landing_page/app/core/common/extensions/context_extension.dart';
import 'package:landing_page/app/core/common/extensions/widget_extension.dart';
import 'package:landing_page/app/modules/home/presentation/pages/decorations/all_decorations.dart';
import 'package:landing_page/app/modules/home/presentation/pages/sections/home_app_bar.dart';
import 'package:landing_page/app/modules/home/presentation/pages/sections/home_apresentation_section.dart';
import 'package:landing_page/app/modules/home/presentation/pages/sections/home_what_we_do_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double maxWidth = 1152;

  final StreamController<double> streamController = StreamController<double>();

  @override
  void dispose() {
    streamController.close();
    log('121');
    super.dispose();
  }

  Stream<double> get textStream {
    homeScrollController.addListener(() {
      // Atualiza a Stream com o novo valor
      if (homeScrollController.positions.isNotEmpty) {
        streamController.add(homeScrollController.offset);
      }
    });

    return streamController.stream;
  }

  @override
  void initState() {
    streamController.add(initialOffset);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue_100,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        onPressed: () {
          //
        },
        child: SvgPicture.asset(
          AppAssets.svgs.whatsapp,
          width: 40,
          height: 40,
        ),
      ).pRight(24).pBottom(24).animate(onComplete: (_) => _.repeat(reverse: true)).slideY(
            delay: 2000.ms,
            begin: 0.1,
            end: 0.0,
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: StreamBuilder<double>(
        stream: textStream,
        builder: (context, snapshot) {
          return Stack(
            children: [
              Stack(
                children: AllDecorations.decorations(context, snapshot.data ?? 0),
              ),
              SingleChildScrollView(
                key: itemKey,
                controller: homeScrollController,
                child: SizedBox(
                  width: context.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeAppBar(maxWidth: maxWidth),
                      HomeApresentationSection(maxWidth: maxWidth),
                      if ((snapshot.data ?? 0) > 100)
                        HomeWhatWeDoSection(maxWidth: maxWidth)
                      else
                        const SizedBox(
                          height: 800,
                        ),
                      const Gap(300),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

ScrollController homeScrollController = ScrollController(initialScrollOffset: initialOffset);
GlobalKey itemKey = GlobalKey();

double initialOffset = 0;
