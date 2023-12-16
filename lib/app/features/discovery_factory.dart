import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/features/app_life_cycle_factory.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/features/daemon/application/daemon_service.dart';
import 'package:reacthome/features/daemon/domain/daemon_entity.dart';
import 'package:reacthome/features/discovery/application/discovery_lifecycle_service.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_entity.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_multicast_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_timeout_service.dart';
import 'package:reacthome/features/discovery/interface/discovery_controller.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/repository.dart';

class DiscoveryFactory {
  static final instance = DiscoveryFactory._();

  DiscoveryFactory._();

  final _repository = ImmutableMapRepository<String, DaemonEntity>();

  final _process = DiscoveryEntity<MulticastSource>();

  final daemonEventBus = GenericEventBus<DaemonEvent>();

  final discoveryEventBus = GenericEventBus<DiscoveryEvent>();

  DaemonService makeDaemonService() => DaemonService(
        eventSink: daemonEventBus,
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
            actor: makeDaemonService(),
          ),
        ),
      );

  DiscoveryTimeoutService makeDiscoveryTimeoutService() =>
      DiscoveryTimeoutService(
        eventSource: daemonEventBus,
        actor: makeDaemonService(),
        timeout: Config.discovery.timeout,
      );

  DiscoveryLifecycleService makeDiscoveryLifecycleService() =>
      DiscoveryLifecycleService(
        eventSource: AppLifecycleFactory.instance.appLifecycleEventBus,
        actor: makeDiscoveryService(),
      );
}
