import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';
import 'package:codewave_systems/app/core/common/extensions/widget_extension.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:codewave_systems/app/core/shared/app_sections_size.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/home_page.dart';
import 'package:codewave_systems/app/ui/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

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
            title: Image.memory(
              AppCache.longLogo,
              height: 35,
              width: 145,
            ).hero('logo').pRight(24).pTop(12),
            actions: [
              if (!context.isMobile) ...[
                Button.third(
                  onPressed: () async {
                    homeScrollController.animateTo(AppSectionSizes.getAboutUsOffset(context), duration: 700.ms, curve: Curves.easeInOutCirc);
                  },
                  child: const Text('Sobre'),
                ).pTop(12),
                const Gap(50),
              ],
              Button.inverted(
                onPressed: () async {
                  homeScrollController.animateTo(AppSectionSizes.getContactOffset(context), duration: 700.ms, curve: Curves.easeInOutCirc);
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
