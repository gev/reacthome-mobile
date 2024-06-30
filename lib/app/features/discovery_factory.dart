import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/features/app_life_cycle_factory.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/features/discovery/application/discovery_lifecycle_service.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_entity.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_multicast_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_timeout_service.dart';
import 'package:reacthome/features/discovery/interface/discovery_controller.dart';
import 'package:reacthome/features/home/application/home_service.dart';
import 'package:reacthome/features/home/domain/home_entity.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/repository.dart';

class DiscoveryFactory {
  static final instance = DiscoveryFactory._();

  DiscoveryFactory._();

  final _repository = ImmutableMapRepository<String, HomeEntity>();

  final _process = DiscoveryEntity<MulticastSource>();

  final homeEventBus = EventBus<HomeEvent>();

  final discoveryEventBus = EventBus<DiscoveryEvent>();

  HomeService makeHomeService() => HomeService(
        eventSink: homeEventBus,
        repository: _repository,
      );

  DiscoveryService<MulticastSource> makeDiscoveryService() => DiscoveryService(
        eventSink: discoveryEventBus,
        process: _process,
      );

  DiscoveryMulticastService makeDiscoveryMulticastService() =>
      DiscoveryMulticastService(
        eventSource: discoveryEventBus,
        actor: makeDiscoveryService(),
        factory: MulticastSourceFactory(
          config: Config.discovery.listen,
          controller: DiscoveryController(
            discovered: makeHomeService(),
            known: HomeFactory.instance.makeHomeService(),
          ),
        ),
      );

  DiscoveryTimeoutService makeDiscoveryTimeoutService() =>
      DiscoveryTimeoutService(
        eventSource: homeEventBus,
        actor: makeHomeService(),
        timeout: Config.discovery.timeout,
      );

  DiscoveryLifecycleService makeDiscoveryLifecycleService() =>
      DiscoveryLifecycleService(
        eventSource: AppLifecycleFactory.instance.appLifecycleEventBus,
        actor: makeDiscoveryService(),
      );
}
