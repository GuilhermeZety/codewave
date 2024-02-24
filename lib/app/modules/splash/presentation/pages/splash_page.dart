// ignore_for_file: use_build_context_synchronously

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:codewave_systems/app/core/common/extensions/widget_extension.dart';
import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/home_page.dart';
import 'package:codewave_systems/app/ui/components/loader.dart';
import 'package:codewave_systems/firebase_options.dart';
import 'package:codewave_systems/main.dart';

class SlpashPage extends StatefulWidget {
  const SlpashPage({super.key});

  @override
  State<SlpashPage> createState() => _SlpashPageState();
}

class _SlpashPageState extends State<SlpashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      await appTexts.init();
      await AppCache.init();
      if (mounted) setState(() {});

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/long_logo.png', height: 35).hero('logo'),
            const Gap(24),
            const Loader(),
          ],
        ),
      ),
    );
  }
}
