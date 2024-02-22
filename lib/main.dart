import 'package:firebase_core/firebase_core.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_remote_config_web/firebase_remote_config_web.dart';
import 'package:flutter/material.dart';
import 'package:landing_page/app/app_widget.dart';
import 'package:landing_page/firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  config = FirebaseRemoteConfigWeb.instance;
  await FirebaseRemoteConfigWeb.instance.fetchAndActivate();

  runApp(
    const AppWidget(),
  );
}

late FirebaseRemoteConfigWeb config;
