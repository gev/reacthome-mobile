import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/widgets/logo.dart';
import 'package:reacthome/ui/widgets/screen/screen.dart';

class SplashScreen {
  static Widget make(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(NavigationRouteNames.welcome);
    });
    return Screen.make(
      body: const Center(child: Logo()),
    );
  }
}
