import 'package:reacthome/features/discovery/discovery_api.dart';
import 'package:reacthome/features/discovery/discovery_connectivity_service.dart';
import 'package:reacthome/features/discovery/discovery_controller.dart';
import 'package:reacthome/features/discovery/discovery_entity.dart';
import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/features/discovery/discovery_lifecycle_service.dart';
import 'package:reacthome/features/discovery/discovery_multicast_service.dart';
import 'package:reacthome/features/discovery/discovery_service.dart';
import 'package:reacthome/features/discovery/discovery_timeout_service.dart';
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

  HomeApi makeHomeApi() => HomeService(
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
        connectivity: ConnectivityFactory.instance.makeConnectivityApi(),
        factory: MulticastSourceFactory(
          group: Config.discovery.listen.group,
          port: Config.discovery.listen.port,
          controller: DiscoveryController(
            discovered: makeHomeApi(),
          ),
        ),
      );

  DiscoveryTimeoutService makeDiscoveryTimeoutService() =>
      DiscoveryTimeoutService(
        eventSource: homeEventBus.stream,
        actor: makeHomeApi(),
        timeout: Config.discovery.renewTimeout,
      );

  DiscoveryLifecycleService makeDiscoveryLifecycleService() =>
      DiscoveryLifecycleService(
        eventSource: AppLifecycleFactory.instance.appLifecycleEventBus.stream,
        discovery: makeDiscoveryService(),
        connectivity: ConnectivityFactory.instance.makeConnectivityApi(),
        restartTimeout: Config.discovery.restartTimeout,
      );

  DiscoveryConnectivityService makeDiscoveryConnectivityService() =>
      DiscoveryConnectivityService(
        eventSource: ConnectivityFactory.instance.connectivityEventBus.stream,
        discovery: makeDiscoveryService(),
      );
}
