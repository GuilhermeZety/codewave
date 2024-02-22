import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/constants/app_colors.dart';
import 'package:landing_page/app/core/common/extensions/context_extension.dart';
import 'package:landing_page/app/core/common/extensions/widget_extension.dart';
import 'package:landing_page/app/modules/home/presentation/pages/decorations/all_decorations.dart';
import 'package:landing_page/app/modules/home/presentation/pages/sections/home_app_bar.dart';
import 'package:landing_page/app/modules/home/presentation/pages/sections/home_apresentation_section.dart';

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
    streamController.add(0);
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
      ).pRight(24).pBottom(24),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(
        children: [
          StreamBuilder(
            stream: textStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                double offset = snapshot.data!;
                return Stack(
                  children: AllDecorations.decorations(context, offset),
                );
              }
              return Container();
            },
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
                  HomeAppBar(maxWidth: maxWidth),
                  HomeApresentationSection(maxWidth: maxWidth),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ScrollController homeScrollController = ScrollController();
GlobalKey itemKey = GlobalKey();
