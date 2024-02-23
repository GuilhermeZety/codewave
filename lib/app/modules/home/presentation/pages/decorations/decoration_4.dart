import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';

class Decoration4 extends StatelessWidget {
  const Decoration4({super.key, required this.offset});
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppSvgs.decoration_4,
          width: 800,
        ),
      ],
    );
  }
}
