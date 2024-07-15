import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/features/app_life_cycle_factory.dart';
import 'package:reacthome/app/features/connection_factory.dart';
import 'package:reacthome/app/features/connectivity_factory.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/app/features/home_connection_factory.dart';
import 'package:reacthome/app/screens/add_home_screen_factory.dart';
import 'package:reacthome/app/screens/discovery_screen_factory.dart';
import 'package:reacthome/app/screens/home_list_screen_factory.dart';
import 'package:reacthome/app/screens/home_screen_factory.dart';
import 'package:reacthome/app/screens/splash_screen_factory.dart';
import 'package:reacthome/app/screens/welcome_screen_factory.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';

Future<Widget> make() async {
  await DiscoveryFactory.instance.makeDiscoveryMulticastService();
  DiscoveryFactory.instance.makeDiscoveryTimeoutService();
  DiscoveryFactory.instance.makeDiscoveryLifecycleService();
  DiscoveryFactory.instance.makeDiscoveryConnectivityService();

  ConnectionFactory.instance.makeLocalWebsocketService();
  ConnectionFactory.instance.makeCloudWebsocketService();

  HomeConnectionFactory.instance.makeActiveConnectionService();
  await HomeConnectionFactory.instance.makeHomeConnectionAutoService();
  await HomeConnectionFactory.instance.makeHomeConnectionLifecycleService();
  await HomeConnectionFactory.instance.makeHomeConnectionConnectivityService();

  ConnectivityFactory.instance.makeConnectivityChangeService();

  return App(
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
        home: await HomeScreenFactory.instance.make(),
        splash: await SplashScreenFactory.instance.make(),
        welcome: WelcomeScreenFactory.instance.make,
        discovery: await DiscoveryScreenFactory.instance.make(),
        addHome: await AddHomeScreenFactory.instance.make(),
        homeList: await AddHomeListFactory.instance.make(),
      ));
}
