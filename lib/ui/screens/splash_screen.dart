import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/widgets/logo.dart';
import 'package:reacthome/ui/widgets/screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(NavigationRouteNames.welcome);
    });
    return Screen(
      body: Center(child: logo(width: 100)),
    );
  }
}
