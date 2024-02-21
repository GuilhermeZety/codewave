import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key, required this.width});

  final double width;

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: SeparatedRow(
        separatorBuilder: () => Gap(widget.width / 5),
        children: [
          SvgPicture.asset(
            AppAssets.svgs.linkedin,
            width: widget.width / 5,
            height: widget.width / 5,
          ),
          SvgPicture.asset(
            AppAssets.svgs.instagram,
            width: widget.width / 6,
            height: widget.width / 6,
          ),
          SvgPicture.asset(
            AppAssets.svgs.github,
            width: widget.width / 5,
            height: widget.width / 5,
          ),
        ],
      ),
    );
  }
}
