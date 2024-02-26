// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:codewave_systems/app/core/common/extensions/widget_extension.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SlpashPage extends StatefulWidget {
  const SlpashPage({super.key});

  @override
  State<SlpashPage> createState() => _SlpashPageState();
}

class _SlpashPageState extends State<SlpashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Stopwatch watcher = Stopwatch()..start();
      AppCache.init().then((value) {
        int time = 1000 - watcher.elapsedMilliseconds;
        Future.delayed(Duration(milliseconds: time < 0 ? 0 : time), () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const HomePage(),
              transitionDuration: 1000.ms,
              transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
            ),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/long_logo.png',
          height: 40,
        ).hero('logo').animate().fade(),
      ),
    );
  }
}
