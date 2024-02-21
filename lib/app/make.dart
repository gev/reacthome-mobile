import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/features/app_life_cycle_factory.dart';
import 'package:reacthome/app/features/connection_factory.dart';
import 'package:reacthome/app/features/daemon_connection_factory.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/app/screens/add_home_screen_factory.dart';
import 'package:reacthome/app/screens/discovery_screen_factory.dart';
import 'package:reacthome/app/screens/splash_screen_factory.dart';
import 'package:reacthome/app/screens/welcome_screen_factory.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';

Widget make() {
  DiscoveryFactory.instance.makeDiscoveryMulticastService();
  DiscoveryFactory.instance.makeDiscoveryTimeoutService();
  DiscoveryFactory.instance.makeDiscoveryLifecycleService();

  ConnectionFactory.instance.makeLocalWebsocketService();
  ConnectionFactory.instance.makeCloudWebsocketService();

  DaemonConnectionFactory.instance.makeActiveConnectionService();
  DaemonConnectionFactory.instance.makeDaemonConnectionAutoService();
  DaemonConnectionFactory.instance.makeDaemonConnectionLifecycleService();

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
        splash: SplashScreenFactory.instance.make,
        welcome: WelcomeScreenFactory.instance.make,
        discovery: DiscoveryScreenFactory.instance.make,
        addHome: AddHomeScreenFactory.instance.make,
      ));
}
