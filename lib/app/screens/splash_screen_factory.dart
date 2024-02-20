import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/screens/splash_screen.dart';

class SplashScreenFactory {
  static final instance = SplashScreenFactory._();

  SplashScreenFactory._();

  Widget make(BuildContext context) => SplashScreen.build(context);
}
