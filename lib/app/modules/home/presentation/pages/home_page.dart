import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/extensions/widget_extension.dart';
import 'package:landing_page/app/modules/home/presentation/pages/sections/home_apresentation_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double maxWidth = 1152;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        onPressed: () {},
        child: SvgPicture.asset(
          AppAssets.svgs.whatsapp,
          width: 40,
          height: 40,
        ),
      ).pRight(24).pBottom(24),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Center(
        child: CustomScrollView(
          controller: Modular.get<ScrollController>(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  HomeApresentationSection(maxWidth: maxWidth),
                  const Gap(10000),
                ],
              ),
            ),
          ],
          // child: Column(
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         const Loader(),
          //         Button.inverted(onPressed: () async {}, child: const Text('Fale Conosco')),
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
