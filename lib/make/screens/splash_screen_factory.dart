import 'package:flutter/widgets.dart';
import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/make/core/preferences_factory.dart';
import 'package:reacthome/ui/screens/splash_screen.dart';

class SplashScreenFactory {
  SplashScreenFactory._();

  static Future<WidgetBuilder> make() async {
    final preferencesService = await PreferencesFactory.makePreferencesApi();
    final homeService = await HomeFactory.makeHomeApi();
    return (_) => SplashScreen(
          preferencesApi: preferencesService,
          homeApi: homeService,
        );
  }
}
