import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/extensions/context_extension.dart';
import 'package:landing_page/app/core/common/extensions/widget_extension.dart';
import 'package:landing_page/app/modules/home/presentation/pages/home_page.dart';
import 'package:landing_page/app/ui/components/button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: context.width,
          constraints: const BoxConstraints(maxWidth: maxWidthDesign),
          child: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            title: Image.asset(
              AppImages.longLogo,
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
              Button.inverted(
                onPressed: () async {
                  //
                },
                padding: EdgeInsets.symmetric(vertical: context.isMobile ? 8 : 20, horizontal: context.isMobile ? 20 : 30),
                child: const Text('Contato'),
              ).pRight(24).pTop(12),
            ],
          ),
        ),
      ],
    );
  }
}
