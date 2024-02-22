import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppTexts {
  late FirebaseRemoteConfig config;
  Future init() async {
    config = FirebaseRemoteConfig.instance;
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    apresentationButton = config.getString('APRESENTATION_BUTTON');
    apresentationSubtitle = config.getString('APRESENTATION_SUBTITLE');
    apresentationTitle = config.getString('APRESENTATION_TITLE');

    whatWeDoText1 = config.getString('WHAT_WE_DO_TEXT_1');
    whatWeDoText2 = config.getString('WHAT_WE_DO_TEXT_2');
    whatWeDoText3 = config.getString('WHAT_WE_DO_TEXT_3');
    whatWeDoText4 = config.getString('WHAT_WE_DO_TEXT_4');

    whatWeDoTitle = config.getString('WHAT_WE_DO_TITLE');

    ourValuesTitle = config.getString('OUR_VALUES_TITLE');

    ourValuesTextTitle1 = config.getString('OUR_VALUES_TEXT_TITLE_1');
    ourValuesText1 = config.getString('OUR_VALUES_TEXT_1');
    ourValuesTextTitle2 = config.getString('OUR_VALUES_TEXT_TITLE_2');
    ourValuesText2 = config.getString('OUR_VALUES_TEXT_2');
    ourValuesTextTitle3 = config.getString('OUR_VALUES_TEXT_TITLE_3');
    ourValuesText3 = config.getString('OUR_VALUES_TEXT_3');
  }

  late String apresentationButton;
  late String apresentationSubtitle;
  late String apresentationTitle;

  late String whatWeDoText1;
  late String whatWeDoText2;
  late String whatWeDoText3;
  late String whatWeDoText4;

  late String whatWeDoTitle;

  late String ourValuesTitle;

  late String ourValuesTextTitle1;
  late String ourValuesText1;
  late String ourValuesTextTitle2;
  late String ourValuesText2;
  late String ourValuesTextTitle3;
  late String ourValuesText3;
}
