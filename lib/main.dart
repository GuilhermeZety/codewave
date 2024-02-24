import 'package:flutter/material.dart';
import 'package:codewave_systems/app/app_widget.dart';
import 'package:codewave_systems/app/core/shared/controller/app_texts.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  runApp(
    const AppWidget(),
  );
}

AppTexts appTexts = AppTexts();
