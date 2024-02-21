import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:landing_page/app/app_module.dart';
import 'package:landing_page/app/app_widget.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
