import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/features/app_life_cycle_factory.dart';
import 'package:reacthome/app/make.dart';
import 'package:reacthome/app/screens/add_home_screen_factory.dart';
import 'package:reacthome/app/screens/discovery_screen_factory.dart';
import 'package:reacthome/app/screens/home_list_screen_factory.dart';
import 'package:reacthome/app/screens/home_screen_factory.dart';
import 'package:reacthome/app/screens/splash_screen_factory.dart';
import 'package:reacthome/app/screens/welcome_screen_factory.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';

void main() {
  make();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    App(
      theme: Config.theme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      appLifeCycle: AppLifecycleFactory.instance.makeAppLifecycleService(),
      navigation: Navigation(
        home: HomeScreenFactory.instance.make,
        splash: SplashScreenFactory.instance.make,
        welcome: WelcomeScreenFactory.instance.make,
        discovery: DiscoveryScreenFactory.instance.make,
        addHome: AddHomeScreenFactory.instance.make,
        homeList: AddHomeListFactory.instance.make,
      ),
    ),
  );
}
