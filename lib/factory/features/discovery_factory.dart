import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/factory/config.dart';
import 'package:reacthome/factory/features/app_life_cycle_factory.dart';
import 'package:reacthome/features/daemon/application/daemon_service.dart';
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

  late EventBus<DaemonEvent> daemonEventBus;
  late DaemonService daemonService;

  late EventBus<DiscoveryEvent> discoveryEventBus;
  late DiscoveryService<MulticastSource> discoveryService;

  DiscoveryFactory._() {
    daemonEventBus = GenericEventBus();

    daemonService = DaemonService(
      eventSink: daemonEventBus,
      repository: ImmutableMapRepository(),
    );

    discoveryEventBus = GenericEventBus();

    discoveryService = DiscoveryService(
      eventSink: discoveryEventBus,
      process: DiscoveryEntity(),
    );

    DiscoveryMulticastService(
      eventSource: discoveryEventBus,
      actor: discoveryService,
      factory: MulticastSourceFactory(
        config: Config.discovery.listen,
        controller: DiscoveryController(actor: daemonService),
      ),
    );

    DiscoveryTimeoutService(
      eventSource: daemonEventBus,
      actor: daemonService,
      timeout: Config.discovery.timeout,
    );

    DiscoveryLifecycleService(
      eventSource: AppLifecycleFactory.instance.appLifecycleEventBus,
      actor: discoveryService,
    );
  }
}
