// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/services.dart';
import 'package:codewave_systems/app/core/common/utils/utils.dart';

class AppCache {
  //SingleTon
  AppCache._();
  static final AppCache _instance = AppCache._();
  factory AppCache() => AppCache._instance;
  //

  static Future init() async {
    List<Uint8List> resp = await Future.wait([
      Utils.getAssetsBytes('assets/images/mac_frame.png'),
      Utils.getAssetsBytes('assets/images/long_logo.png'),
      Utils.getAssetsBytes('assets/instagram.svg'),
      Utils.getAssetsBytes('assets/linkedin.svg'),
      Utils.getAssetsBytes('assets/github.svg'),
      Utils.getAssetsBytes('assets/whatsapp.svg'),
      Utils.getAssetsBytes('assets/decoration_1.svg'),
      Utils.getAssetsBytes('assets/decoration_2.svg'),
      Utils.getAssetsBytes('assets/decoration_4.svg'),
      Utils.getAssetsBytes('assets/decoration_5.svg'),
      Utils.getAssetsBytes('assets/decoration_6.svg'),
      Utils.getAssetsBytes('assets/line_r.svg'),
      Utils.getAssetsBytes('assets/line_l.svg'),
      Utils.getAssetsBytes('assets/water_layer_1.svg'),
      Utils.getAssetsBytes('assets/water_layer_2.svg'),
      Utils.getAssetsBytes('assets/water_layer_3.svg'),
      Utils.getAssetsBytes('assets/team.svg'),
    ]);

    macFrame = resp[0];
    longLogo = resp[1];
    instagram = resp[2];
    linkedin = resp[3];
    github = resp[4];
    whatsapp = resp[5];
    decoration_1 = resp[6];
    decoration_2 = resp[7];
    decoration_4 = resp[8];
    decoration_5 = resp[9];
    decoration_6 = resp[10];

    line_r = resp[11];
    line_l = resp[12];
    water_layer_1 = resp[13];
    water_layer_2 = resp[14];
    water_layer_3 = resp[15];
    team = resp[16];
  }

  static late Uint8List macFrame;
  static late Uint8List longLogo;
  static late Uint8List instagram;
  static late Uint8List linkedin;
  static late Uint8List github;
  static late Uint8List whatsapp;
  static late Uint8List decoration_1;
  static late Uint8List decoration_2;
  static late Uint8List decoration_4;
  static late Uint8List decoration_5;
  static late Uint8List decoration_6;
  static late Uint8List line_r;
  static late Uint8List line_l;
  static late Uint8List water_layer_1;
  static late Uint8List water_layer_2;
  static late Uint8List water_layer_3;
  static late Uint8List team;
}
