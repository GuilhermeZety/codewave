import 'package:codewave_systems/app/core/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppSectionSizes {
  static double _apresentationSize(BuildContext context) => context.height;
  static double _whatWeDoSize(BuildContext context) {
    double apresentationSize = _apresentationSize(context);

    double size = 680;

    if (context.isNotDesktop) {
      var w = context.width;

      if (w < 400) {
        size = 1050;
      } else if (w < 450) {
        size = 900;
      } else if (w < 500) {
        size = 820;
      } else if (w < 550) {
        size = 800;
      } else if (w < 600) {
        size = 750;
      }
    }

    return apresentationSize + size;
  }

  static double _ourValuesSize(BuildContext context) {
    double wwdSize = _whatWeDoSize(context);

    double size = 780;

    if (context.isNotDesktop) {
      var w = context.width;

      if (w < 360) {
        size = 1420;
      } else if (w < 400) {
        size = 1400;
      } else if (w < 530) {
        size = 1450;
      } else if (w < 630) {
        size = 1520;
      } else if (w < 735) {
        size = 1480;
      } else if (w < 900) {
        size = 1080;
      }
    }

    return wwdSize + size;
  }

  static double _aboutUsSize(BuildContext context) {
    double orVSize = _ourValuesSize(context);

    double size = 960;

    if (context.isNotDesktop) {
      var w = context.width;

      if (w < 380) {
        size = 1080;
      } else if (w < 400) {
        size = 1000;
      } else if (w < 460) {
        size = 1080;
      } else if (w < 610) {
        size = 1000;
      } else if (w < 732) {
        size = 1080;
      } else if (w < 900) {
        size = 1050;
      }
    }

    return orVSize + size;
  }

  static double _projectFlowSize(BuildContext context) {
    double auVSize = _aboutUsSize(context);

    double size = 800;

    return auVSize + size;
  }

  static double get getApresentationOffset => 0;
  static double getWhatWeDoOffset(BuildContext context) => _apresentationSize(context) - 100;
  static double getOurValuesOffset(BuildContext context) => _whatWeDoSize(context);
  static double getAboutUsOffset(BuildContext context) => _ourValuesSize(context);
  static double getProjectFlowOffset(BuildContext context) => _aboutUsSize(context);
  static double getContactOffset(BuildContext context) => _projectFlowSize(context);
}
