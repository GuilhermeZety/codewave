import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:codewave_systems/app/core/common/constants/app_theme.dart';
import 'package:codewave_systems/app/modules/splash/presentation/pages/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeWave Systems',
      darkTheme: AppTheme.light,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const SlpashPage(),
    );
  }
}
