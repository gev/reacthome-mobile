import 'package:reacthome/app/features/connection_factory.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/app/features/home_connection_factory.dart';
import 'package:reacthome/app/screens/discovery_screen_factory.dart';
import 'package:reacthome/app/screens/home_screen_factory.dart';
import 'package:reacthome/util/service_locator.dart';

void make() {
  DiscoveryFactory.instance.makeDiscoveryMulticastService();
  DiscoveryFactory.instance.makeDiscoveryTimeoutService();
  DiscoveryFactory.instance.makeDiscoveryLifecycleService();

  ConnectionFactory.instance.makeLocalWebsocketService();
  ConnectionFactory.instance.makeCloudWebsocketService();

  HomeConnectionFactory.instance.makeActiveConnectionService();
  HomeConnectionFactory.instance.makeHomeConnectionAutoService();
  HomeConnectionFactory.instance.makeHomeConnectionLifecycleService();

  $.registerFactory(
      DiscoveryScreenFactory.instance.makeDiscoveryStatusViewModel);
  $.registerFactory(
      DiscoveryScreenFactory.instance.makeDiscoveryHomeListViewModel);
  $.registerBuilder(DiscoveryScreenFactory.instance.makeDiscoveryHomeViewModel);

  $.registerFactory(HomeScreenFactory.instance.makeHomeListViewModel);
  $.registerBuilder(HomeScreenFactory.instance.makeHomeViewModel);
}
