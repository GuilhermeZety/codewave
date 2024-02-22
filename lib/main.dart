import 'package:flutter/material.dart';
import 'package:landing_page/app/app_widget.dart';
import 'package:landing_page/app/core/shared/controller/app_texts.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  runApp(
    const AppWidget(),
  );
}

AppTexts appTexts = AppTexts();
