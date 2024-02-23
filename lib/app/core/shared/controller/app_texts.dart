import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppTexts {
  late FirebaseRemoteConfig config;
  Future init() async {
    config = FirebaseRemoteConfig.instance;
    await config.fetchAndActivate();
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

    aboutUsTitle = config.getString('ABOUT_US_TITLE');
    aboutUsSubtitle = config.getString('ABOUT_US_SUBTITLE');
    aboutUsText1 = config.getString('ABOUT_US_TEXT_1');
    aboutUsText2 = config.getString('ABOUT_US_TEXT_2');
    aboutUsText3 = config.getString('ABOUT_US_TEXT_3');
    aboutUsText4 = config.getString('ABOUT_US_TEXT_4');

    projectFlowTitle = config.getString('PROJECT_FLOW_TITLE');
    projectFlowCardTitle1 = config.getString('PROJECT_FLOW_CARD_TITLE_1');
    projectFlowCardText1 = config.getString('PROJECT_FLOW_CARD_TEXT_1');
    projectFlowCardTitle2 = config.getString('PROJECT_FLOW_CARD_TITLE_2');
    projectFlowCardText2 = config.getString('PROJECT_FLOW_CARD_TEXT_2');
    projectFlowCardTitle3 = config.getString('PROJECT_FLOW_CARD_TITLE_3');
    projectFlowCardText3 = config.getString('PROJECT_FLOW_CARD_TEXT_3');
    projectFlowCardTitle4 = config.getString('PROJECT_FLOW_CARD_TITLE_4');
    projectFlowCardText4 = config.getString('PROJECT_FLOW_CARD_TEXT_4');
    projectFlowCardTitle5 = config.getString('PROJECT_FLOW_CARD_TITLE_5');
    projectFlowCardText5 = config.getString('PROJECT_FLOW_CARD_TEXT_5');
    projectFlowCardTitle6 = config.getString('PROJECT_FLOW_CARD_TITLE_6');
    projectFlowCardText6 = config.getString('PROJECT_FLOW_CARD_TEXT_6');
    projectFlowCardTitle7 = config.getString('PROJECT_FLOW_CARD_TITLE_7');
    projectFlowCardText7 = config.getString('PROJECT_FLOW_CARD_TEXT_7');
    projectFlowCardTitle8 = config.getString('PROJECT_FLOW_CARD_TITLE_8');
    projectFlowCardText8 = config.getString('PROJECT_FLOW_CARD_TEXT_8');
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

  late String aboutUsTitle;
  late String aboutUsSubtitle;
  late String aboutUsText1;
  late String aboutUsText2;
  late String aboutUsText3;
  late String aboutUsText4;

  late String projectFlowTitle;
  late String projectFlowCardTitle1;
  late String projectFlowCardText1;
  late String projectFlowCardTitle2;
  late String projectFlowCardText2;
  late String projectFlowCardTitle3;
  late String projectFlowCardText3;
  late String projectFlowCardTitle4;
  late String projectFlowCardText4;
  late String projectFlowCardTitle5;
  late String projectFlowCardText5;
  late String projectFlowCardTitle6;
  late String projectFlowCardText6;
  late String projectFlowCardTitle7;
  late String projectFlowCardText7;
  late String projectFlowCardTitle8;
  late String projectFlowCardText8;
}
