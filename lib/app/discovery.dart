import 'package:reacthome/app/app_life_cycle.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/features/daemon/application/daemon_service.dart';
import 'package:reacthome/features/discovery/application/discovery_lifecycle_service.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_entity.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_multicast_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_repository.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_timeout_service.dart';
import 'package:reacthome/features/discovery/interface/discovery_controller.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/event_bus.dart';

class Discovery {
  static final instance = Discovery._();

  late EventBus<DaemonEvent> eventBus;
  late DaemonService service;

  late EventBus<DiscoveryEvent> processEventBus;
  late DiscoveryService processService;

  Discovery._() {
    eventBus = EventBus<DaemonEvent>();

    service = DaemonService(
      eventSink: eventBus,
      repository: DiscoveryRepository(),
    );

    processEventBus = EventBus<DiscoveryEvent>();

    processService = DiscoveryService(
      eventSink: processEventBus,
      process: DiscoveryEntity(),
    );

    DiscoveryMulticastService(
      eventSource: processEventBus,
      actor: processService,
      factory: MulticastSourceFactory(
        config: Config.discovery.listen,
        controller: DiscoveryController(actor: service),
      ),
    );

    DiscoveryTimeoutService(
      eventSource: eventBus,
      actor: service,
      timeout: Config.discovery.timeout,
    );

    DiscoveryLifecycleService(
      eventSource: AppLifecycle.instance.eventBus,
      actor: processService,
    );
  }
}
