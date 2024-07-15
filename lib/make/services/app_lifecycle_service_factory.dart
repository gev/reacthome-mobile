import 'package:reacthome/make/config.dart';
import 'package:reacthome/make/core/app_lifecycle_factory.dart';
import 'package:reacthome/make/core/connectivity_factory.dart';
import 'package:reacthome/make/core/discovery_factory.dart';
import 'package:reacthome/make/core/home_connection_factory.dart';
import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/services/app_life_cycle/app_life_cycle_discovery_service.dart';
import 'package:reacthome/services/app_life_cycle/app_lifecycle_home_connection_service.dart';

class AppLifecycleServiceFactory {
  AppLifecycleServiceFactory._();

  static DiscoveryLifecycleService makeLifecycleDiscoveryService() =>
      DiscoveryLifecycleService(
        eventSource: AppLifecycleFactory.appLifecycleEventBus.stream,
        discovery: DiscoveryFactory.makeDiscoveryApi(),
        connectivity: ConnectivityFactory.makeConnectivityApi(),
        restartTimeout: Config.discovery.restartTimeout,
      );

  static Future<AppLifecycleHomeConnectionService>
      makeLifecycleHomeConnectionService() async =>
          AppLifecycleHomeConnectionService(
            eventSource: AppLifecycleFactory.appLifecycleEventBus.stream,
            home: await HomeFactory.makeHomeApi(),
            connection: HomeConnectionFactory.makeHomeConnectionApi(),
            connectivity: ConnectivityFactory.makeConnectivityApi(),
            reconnectTimeout: Config.connection.reconnectTimeout,
          );

  static Future<void> make() async {
    makeLifecycleDiscoveryService();
    await makeLifecycleHomeConnectionService();
  }
}
