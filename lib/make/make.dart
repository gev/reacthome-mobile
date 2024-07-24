import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reacthome/make/config.dart';
import 'package:reacthome/make/controllers/reacthome_controller_factory.dart';
import 'package:reacthome/make/core/app_lifecycle_factory.dart';
import 'package:reacthome/make/screens/add_home_screen_factory.dart';
import 'package:reacthome/make/screens/discovery_screen_factory.dart';
import 'package:reacthome/make/screens/home_list_screen_factory.dart';
import 'package:reacthome/make/screens/home_screen_factory.dart';
import 'package:reacthome/make/screens/splash_screen_factory.dart';
import 'package:reacthome/make/screens/welcome_screen_factory.dart';
import 'package:reacthome/make/services/app_lifecycle_service_factory.dart';
import 'package:reacthome/make/services/connection_service_factory.dart';
import 'package:reacthome/make/services/connectivity_service_factory.dart';
import 'package:reacthome/make/services/discovery_service_factory.dart';
import 'package:reacthome/make/services/my_home_service_factory.dart';
import 'package:reacthome/ui/navigation.dart';
import 'package:reacthome/ui/views/app.dart';

Future<Widget> make() async {
  await ConnectionServiceFactory.make();
  await DiscoveryServiceFactory.make();
  await AppLifecycleServiceFactory.make();
  await ConnectivityServiceFactory.make();

  await ReacthomeControllerFactory.makeControllers();

  await HomeServiceFactory.make();

  return App(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en'),
      Locale('ru'),
    ],
    appLifeCycle: AppLifecycleFactory.makeAppLifecycleApi(),
    navigation: Navigation(
      home: await HomeScreenFactory.make(),
      splash: await SplashScreenFactory.make(),
      welcome: WelcomeScreenFactory.make,
      discovery: await DiscoveryScreenFactory.make(),
      addHome: await AddHomeScreenFactory.make(),
      myHomes: await AddHomeListFactory.make(),
    ),
    seedColor: Config.theme.seedColor,
  );
}
