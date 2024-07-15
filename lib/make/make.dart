import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reacthome/make/config.dart';
import 'package:reacthome/make/features/app_life_cycle_factory.dart';
import 'package:reacthome/make/features/connection_factory.dart';
import 'package:reacthome/make/features/connectivity_factory.dart';
import 'package:reacthome/make/features/discovery_factory.dart';
import 'package:reacthome/make/features/home_connection_factory.dart';
import 'package:reacthome/make/features/home_factory.dart';
import 'package:reacthome/make/screens/add_home_screen_factory.dart';
import 'package:reacthome/make/screens/discovery_screen_factory.dart';
import 'package:reacthome/make/screens/home_list_screen_factory.dart';
import 'package:reacthome/make/screens/home_screen_factory.dart';
import 'package:reacthome/make/screens/splash_screen_factory.dart';
import 'package:reacthome/make/screens/welcome_screen_factory.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';

Future<Widget> make() async {
  DiscoveryFactory.instance.makeDiscoveryMulticastService();
  DiscoveryFactory.instance.makeDiscoveryTimeoutService();
  DiscoveryFactory.instance.makeDiscoveryLifecycleService();
  DiscoveryFactory.instance.makeDiscoveryConnectivityService();

  ConnectionFactory.instance.makeLocalWebsocketService();
  ConnectionFactory.instance.makeCloudWebsocketService();

  await HomeConnectionFactory.instance.makeHomeConnectionAutoService();
  await HomeConnectionFactory.instance.makeHomeConnectionLifecycleService();
  await HomeConnectionFactory.instance.makeHomeConnectionConnectivityService();
  HomeConnectionFactory.instance.makeActiveConnectionService();

  await HomeFactory.instance.makeHomeDiscoveryService();

  ConnectivityFactory.instance.makeConnectivityChangeService();

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
    appLifeCycle: AppLifecycleFactory.instance.makeAppLifecycleApi(),
    navigation: Navigation(
      home: await HomeScreenFactory.instance.make(),
      splash: await SplashScreenFactory.instance.make(),
      welcome: WelcomeScreenFactory.instance.make,
      discovery: await DiscoveryScreenFactory.instance.make(),
      addHome: await AddHomeScreenFactory.instance.make(),
      homeList: await AddHomeListFactory.instance.make(),
    ),
    seedColor: Config.theme.seedColor,
  );
}
