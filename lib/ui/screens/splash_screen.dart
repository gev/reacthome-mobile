import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/assets.dart';
import 'package:reacthome/ui/widgets/screen/screen.dart';

class SplashScreen {
  static Widget make(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(NavigationRouteNames.home);
    });
    return Screen.make(
      body: Center(
        child: SvgPicture.asset(Assets.logo, width: 100),
      ),
    );
  }
}
