import 'package:flutter/material.dart';
import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/decorations/decoration_1.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/decorations/decoration_2.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/decorations/decoration_3.dart';

class AllDecorations {
  static List<Widget> decorations(BuildContext context, double offset) => [
        if (!(context.isMobile || context.isTablet))
          Decoration1(
            offset: offset,
          ),
        if (!(context.isMobile || context.isTablet))
          Decoration2(
            offset: offset,
          ),
        Decoration3(
          offset: offset,
        ),
      ];
}
