import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/extensions/context_extension.dart';
import 'package:landing_page/app/core/common/extensions/widget_extension.dart';
import 'package:landing_page/app/ui/components/button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.maxWidth});

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            title: Image.asset(
              AppAssets.images.longLogo,
              height: 35,
            ).pRight(24).pTop(12).hero('logo'),
            actions: [
              if (!context.isMobile) ...[
                Button.third(
                  onPressed: () async {
                    //
                  },
                  child: const Text('Sobre'),
                ).pTop(12),
                const Gap(50),
              ],
              Button.inverted(onPressed: null, child: const Text('Contato')).pRight(24).pTop(12),
            ],
          ),
        ),
      ],
    );
  }
}
