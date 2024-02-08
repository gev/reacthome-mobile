import 'package:flutter/widgets.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/features/app_life_cycle_factory.dart';
import 'package:reacthome/app/features/connection_factory.dart';
import 'package:reacthome/app/features/daemon_connection_factory.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/app/ui/screens/discovery_screen_factory.dart';
import 'package:reacthome/app/ui/screens/home_screen_factory.dart';
import 'package:reacthome/app/ui/screens/splash_screen_factory.dart';
import 'package:reacthome/app/ui/screens/welcome_screen_factory.dart';
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

  return App.make(
      theme: Config.theme,
      appLifeCycle: AppLifecycleFactory.instance.makeAppLifecycleService(),
      navigation: Navigation(
        splash: SplashScreenFactory.instance.make,
        welcome: WelcomeScreenFactory.instance.make,
        discovery: DiscoveryScreenFactory.instance.make,
        home: HomeScreenFactory.instance.make,
      ));
}
