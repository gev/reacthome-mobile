import 'package:reacthome/application/discovery/discovery_api.dart';
import 'package:reacthome/application/discovery/discovery_entity.dart';
import 'package:reacthome/application/discovery/discovery_event.dart';
import 'package:reacthome/application/discovery/discovery_service.dart';
import 'package:reacthome/domain/home/home_api.dart';
import 'package:reacthome/domain/home/home_entity.dart';
import 'package:reacthome/domain/home/home_event.dart';
import 'package:reacthome/domain/home/home_service.dart';
import 'package:reacthome/entity_framework/infrastructure/bus/bus.dart';
import 'package:reacthome/entity_framework/infrastructure/repository/map_repository.dart';
import 'package:reacthome/infrastructure/discovery/discovery_connectivity_service.dart';
import 'package:reacthome/infrastructure/discovery/discovery_controller.dart';
import 'package:reacthome/infrastructure/discovery/discovery_lifecycle_service.dart';
import 'package:reacthome/infrastructure/discovery/discovery_multicast_service.dart';
import 'package:reacthome/infrastructure/discovery/discovery_timeout_service.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/make/application/app_life_cycle_factory.dart';
import 'package:reacthome/make/application/connectivity_factory.dart';
import 'package:reacthome/make/config.dart';

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
          group: Config.discovery.listen.group,
          port: Config.discovery.listen.port,
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
