// ignore_for_file: use_build_context_synchronously

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/app/core/common/constants/app_assets.dart';
import 'package:landing_page/app/core/common/extensions/widget_extension.dart';
import 'package:landing_page/app/modules/home/presentation/pages/home_page.dart';
import 'package:landing_page/app/ui/components/loader.dart';
import 'package:landing_page/firebase_options.dart';
import 'package:landing_page/main.dart';

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
            Image.asset(AppAssets.images.longLogo, height: 35).hero('logo'),
            const Gap(24),
            const Loader(),
          ],
        ),
      ),
    );
  }
}
