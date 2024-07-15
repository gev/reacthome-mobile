import 'package:reacthome/features/discovery/discovery_api.dart';
import 'package:reacthome/features/discovery/discovery_entity.dart';
import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/features/discovery/discovery_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_connectivity_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_lifecycle_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_multicast_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_timeout_service.dart';
import 'package:reacthome/features/discovery/interface/discovery_controller.dart';
import 'package:reacthome/features/home/home_api.dart';
import 'package:reacthome/features/home/home_entity.dart';
import 'package:reacthome/features/home/home_event.dart';
import 'package:reacthome/features/home/home_service.dart';
import 'package:reacthome/infrastructure/bus/bus.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/infrastructure/repository/map_repository.dart';
import 'package:reacthome/make/config.dart';
import 'package:reacthome/make/features/app_life_cycle_factory.dart';
import 'package:reacthome/make/features/connectivity_factory.dart';

class DiscoveryFactory {
  static final instance = DiscoveryFactory._();

  DiscoveryFactory._();

  final _repository = MapRepository<String, HomeEntity>();

  final _process = DiscoveryEntity<MulticastSource>();

  final homeEventBus = Bus<HomeEvent>();

  final discoveryEventBus = Bus<DiscoveryEvent>();

  HomeApi makeHomeService() => HomeService(
        eventSink: homeEventBus.sink,
        repository: _repository,
      );

  DiscoveryApi<MulticastSource> makeDiscoveryService() => DiscoveryService(
        eventSink: discoveryEventBus.sink,
        process: _process,
      );

  DiscoveryMulticastService makeDiscoveryMulticastService() =>
      DiscoveryMulticastService(
        eventSource: discoveryEventBus.stream,
        discovery: makeDiscoveryService(),
        connectivity: ConnectivityFactory.instance.makeConnectivityService(),
        factory: MulticastSourceFactory(
          config: Config.discovery.listen,
          controller: DiscoveryController(
            discovered: makeHomeService(),
          ),
        ),
      );

  DiscoveryTimeoutService makeDiscoveryTimeoutService() =>
      DiscoveryTimeoutService(
        eventSource: homeEventBus.stream,
        actor: makeHomeService(),
        timeout: Config.discovery.renewTimeout,
      );

  DiscoveryLifecycleService makeDiscoveryLifecycleService() =>
      DiscoveryLifecycleService(
        eventSource: AppLifecycleFactory.instance.appLifecycleEventBus.stream,
        discovery: makeDiscoveryService(),
        connectivity: ConnectivityFactory.instance.makeConnectivityService(),
        restartTimeout: Config.discovery.restartTimeout,
      );

  DiscoveryConnectivityService makeDiscoveryConnectivityService() =>
      DiscoveryConnectivityService(
        eventSource: ConnectivityFactory.instance.connectivityEventBus.stream,
        discovery: makeDiscoveryService(),
      );
}
