import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/screens/splash_screen.dart';

class SplashScreenFactory {
  static final instance = SplashScreenFactory._();

  late WidgetBuilder screen;

  SplashScreenFactory._() {
    screen = (_) => SplashScreen.make();
  }
}
