// ignore_for_file: use_build_context_synchronously

import 'package:codewave_systems/app/core/shared/app_cache.dart';
import 'package:codewave_systems/app/modules/home/presentation/pages/home_page.dart';
import 'package:codewave_systems/app/ui/components/loader.dart';
import 'package:flutter/material.dart';

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
      AppCache.init().then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Loader(),
      ),
    );
  }
}
