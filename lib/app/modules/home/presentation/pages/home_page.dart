import 'dart:async';

import 'package:codewave_systems/app/core/common/constants/app_colors.dart';
import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';
import 'package:codewave_systems/app/core/common/extensions/widget_extension.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/decorations/all_decorations.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/sections/home_about_us_section.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/sections/home_app_bar.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/sections/home_apresentation_section.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/sections/home_contact_section.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/sections/home_footer_section.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/sections/home_our_values_section.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/sections/home_project_flow_section.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/sections/home_what_we_do_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController<double> streamController = StreamController<double>();

  @override
  void dispose() {
    streamController.close();
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

  List<Widget> get sections => [
        const HomeAppBar(),
        const HomeApresentationSection(),
        const HomeWhatWeDoSection(),
        const HomeOurValuesSection().pTop(100),
        const HomeAboutUsSection().pTop(100),
        const HomeProjectFlowSection(),
        const HomeContactSection().pTop(100),
        const HomeFooterSection(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue_100,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        onPressed: () {
          //
        },
        child: SvgPicture.memory(
          AppCache.whatsapp,
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
          if (context.isNotDesktop) {
            return SizedBox(
              width: context.width,
              height: context.height,
              child: SingleChildScrollView(
                controller: homeScrollController,
                child: Column(
                  children: sections,
                ),
              ),
            );
          }
          return SizedBox(
            width: context.width,
            height: context.height,
            child: Stack(
              children: [
                if (!context.isNotDesktop && snapshot.data != null && (snapshot.data ?? 0) < context.height * 1)
                  Stack(
                    children: AllDecorations.decorations(context, snapshot.data ?? 0),
                  ),
                SizedBox(
                  width: context.width,
                  height: context.height,
                  child: SingleChildScrollView(
                    controller: homeScrollController,
                    child: Column(
                      children: sections,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

ScrollController homeScrollController = ScrollController(initialScrollOffset: initialOffset);

double initialOffset = 0;

const double maxWidthDesign = 1152;
