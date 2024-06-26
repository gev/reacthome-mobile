import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/layouts/center_layout.dart';
import 'package:reacthome/ui/widgets/logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(NavigationRouteNames.welcome);
    });
    return CenterLayout(
      body: logo(width: 120),
    );
  }
}
