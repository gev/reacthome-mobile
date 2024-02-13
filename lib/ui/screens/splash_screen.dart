import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/widgets/logo.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold.dart';

class SplashScreen {
  static Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(NavigationRouteNames.welcome);
    });
    return Scaffold(
      body: const SafeArea(child: Center(child: Logo())),
    );
  }
}
