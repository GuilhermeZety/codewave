import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';

class Decoration4 extends StatelessWidget {
  const Decoration4({super.key, required this.offset});
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.memory(
          AppCache.decoration_4,
          width: 800,
        ),
      ],
    );
  }
}
