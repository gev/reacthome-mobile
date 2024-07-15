import 'package:flutter/widgets.dart';
import 'package:reacthome/make/features/home_factory.dart';
import 'package:reacthome/ui/screens/splash_screen.dart';

class SplashScreenFactory {
  SplashScreenFactory._();

  static Future<WidgetBuilder> make() async {
    final homeService = await HomeFactory.makeHomeApi();
    return (_) => SplashScreen(home: homeService);
  }
}
