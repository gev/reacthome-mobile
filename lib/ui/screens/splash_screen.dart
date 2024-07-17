import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/ui/navigation.dart';
import 'package:reacthome/ui/widgets/logo.dart';
import 'package:reacthome/ui_kit/layouts/center_layout.dart';
import 'package:reacthome/util/navigator_extension.dart';

class SplashScreen extends StatelessWidget {
  final HomeApi home;

  const SplashScreen({required this.home, super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).clearNamed(
        home.count > 0
            ? NavigationRouteNames.homeList
            : NavigationRouteNames.welcome,
      ),
    );
    return CenterLayout(
      body: logo(width: 120),
    );
  }
}
