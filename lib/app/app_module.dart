import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:landing_page/app/modules/home/presentation/pages/home_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<ScrollController>(() => ScrollController());
  }

  @override
  void routes(RouteManager r) {
    //CHILDS
    r.child(
      '/',
      child: (args) => const HomePage(),
      transition: TransitionType.fadeIn,
      duration: 500.ms,
    );
  }
}
