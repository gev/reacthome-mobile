import 'package:reacthome/app/app_life_cycle.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_process_event.dart';
import 'package:reacthome/features/discovery/application/discovery_process_lifecycle_service.dart';
import 'package:reacthome/features/discovery/application/discovery_process_service.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_entity.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_process_multicast_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_repository.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_timeout_service.dart';
import 'package:reacthome/features/discovery/interface/discovery_controller.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/event_bus.dart';

class Discovery {
  static final instance = Discovery._();

  late EventBus<DiscoveryEvent> eventBus;
  late DiscoveryService service;

  late EventBus<DiscoveryProcessEvent> processEventBus;
  late DiscoveryProcessService processService;

  Discovery._() {
    eventBus = EventBus<DiscoveryEvent>();

    service = DiscoveryService(
      eventSink: eventBus,
      repository: DiscoveryRepository(),
    );

    processEventBus = EventBus<DiscoveryProcessEvent>();

    processService = DiscoveryProcessService(
      eventSink: processEventBus,
      process: DiscoveryProcessEntity(),
    );

    DiscoveryProcessMulticastService(
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

    DiscoveryProcessLifecycleService(
      eventSource: AppLifecycle.instance.eventBus,
      actor: processService,
    );
  }
}
