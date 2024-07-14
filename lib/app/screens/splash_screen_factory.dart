import 'package:flutter/widgets.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/ui/screens/splash_screen.dart';

class SplashScreenFactory {
  static final instance = SplashScreenFactory._();

  SplashScreenFactory._();

  Future<WidgetBuilder> make() async {
    final homeService = await HomeFactory.instance.makeHomeService();
    return (_) => SplashScreen(home: homeService);
  }
}
