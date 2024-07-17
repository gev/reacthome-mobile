import 'package:reacthome/controllers/discovery/discovery_controller.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/make/config.dart';
import 'package:reacthome/make/core/connectivity_factory.dart';
import 'package:reacthome/make/core/discovery_factory.dart';
import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/services/discovery/discovery_home_update_service.dart';
import 'package:reacthome/services/discovery/discovery_multicast_service.dart';
import 'package:reacthome/services/discovery/discovery_timeout_service.dart';

class DiscoveryServiceFactory {
  DiscoveryServiceFactory._();

  static Future<DiscoveryHomeUpdateService>
      makeDiscoveryHomeUpdateService() async => DiscoveryHomeUpdateService(
            eventSource: DiscoveryFactory.homeEventBus.stream,
            home: await HomeFactory.makeHomeApi(),
          );

  static DiscoveryMulticastService makeDiscoveryMulticastService() =>
      DiscoveryMulticastService(
        eventSource: DiscoveryFactory.discoveryEventBus.stream,
        discovery: DiscoveryFactory.makeDiscoveryApi(),
        connectivity: ConnectivityFactory.makeConnectivityApi(),
        factory: MulticastSourceFactory(
          group: Config.discovery.listen.group,
          port: Config.discovery.listen.port,
          controller: DiscoveryController(
            discovered: DiscoveryFactory.makeHomeApi(),
          ),
        ),
      );

  static DiscoveryTimeoutService makeDiscoveryTimeoutService() =>
      DiscoveryTimeoutService(
        eventSource: DiscoveryFactory.homeEventBus.stream,
        discovered: DiscoveryFactory.makeHomeApi(),
        timeout: Config.discovery.renewTimeout,
      );

  static Future<void> make() async {
    DiscoveryServiceFactory.makeDiscoveryMulticastService();
    DiscoveryServiceFactory.makeDiscoveryTimeoutService();
    await DiscoveryServiceFactory.makeDiscoveryHomeUpdateService();
  }
}
