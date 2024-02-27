import 'package:codewave_systems/app/core/common/constants/app_colors.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

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
          SocialItem(
            icon: AppCache.linkedin,
            width: widget.width / 5,
            link: Links.linkedin,
          ),
          SocialItem(
            icon: AppCache.instagram,
            width: widget.width / 6,
            link: Links.instagram,
          ),
          SocialItem(
            icon: AppCache.github,
            width: widget.width / 5,
            link: Links.github,
          ),
        ],
      ),
    );
  }
}

class SocialItem extends StatefulWidget {
  const SocialItem({
    super.key,
    required this.icon,
    required this.width,
    required this.link,
  });

  final Uint8List icon;
  final double width;
  final String link;

  @override
  State<SocialItem> createState() => _SocialItemState();
}

class _SocialItemState extends State<SocialItem> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        color = AppColors.primary;
        if (mounted) setState(() {});
      },
      onExit: (_) {
        color = null;
        if (mounted) setState(() {});
      },
      child: GestureDetector(
        onTap: () {
          launchUrl(
            Uri.parse(widget.link),
            mode: LaunchMode.externalApplication,
          );
        },
        child: SvgPicture.memory(
          widget.icon,
          width: widget.width,
          height: widget.width,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        ),
      ),
    );
  }
}

class Links {
  static String instagram = 'https://www.instagram.com/cw.systems/';
  //TODO: github link
  static String github = 'https://www.instagram.com/cw.systems/';
  static String linkedin = 'https://www.linkedin.com/company/codewave-systems/';
}
