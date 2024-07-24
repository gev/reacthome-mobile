import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/preferences/preferences_api.dart';
import 'package:reacthome/ui/navigation.dart';
import 'package:reacthome/ui/widgets/logo.dart';
import 'package:reacthome/ui_kit/layouts/center_layout.dart';
import 'package:reacthome/util/navigator_extension.dart';

class SplashScreen extends StatelessWidget {
  final PreferencesApi preferencesApi;
  final HomeApi homeApi;

  const SplashScreen({
    required this.preferencesApi,
    required this.homeApi,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () {
        final navigator = Navigator.of(context);
        if (preferencesApi.isHomeSelected) {
          navigator.clearNamed(
            NavigationRouteNames.home,
            arguments: (id: preferencesApi.home),
          );
        } else {
          navigator.clearNamed(
            homeApi.homes.isEmpty
                ? NavigationRouteNames.welcome
                : NavigationRouteNames.preferredHomes,
          );
        }
      },
    );
    return CenterLayout(
      body: logo(width: 120),
    );
  }
}
