import 'package:reacthome/app/app_life_cycle.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/features/discovery/application/discovery_process_service.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_process_lifecycle_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_process_multicast_service.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_repository.dart';
import 'package:reacthome/features/discovery/infrastructure/discovery_timeout_service.dart';
import 'package:reacthome/features/discovery/interface/discovery_controller.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/bus.dart';

class Discovery {
  static final instance = Discovery._();

  late Bus<DiscoveryEvent> eventBus;
  late DiscoveryService service;

  late Bus<DiscoveryProcessEvent> processEventBus;
  late DiscoveryProcessService processService;

  Discovery._() {
    eventBus = Bus<DiscoveryEvent>();

    service = DiscoveryService(
      eventSink: eventBus,
      repository: DiscoveryRepository(),
    );

    processEventBus = Bus<DiscoveryProcessEvent>();

    processService = DiscoveryProcessService(eventSink: processEventBus);

    DiscoveryProcessMulticastService(
      eventSource: processEventBus,
      process: processService,
      factory: MulticastSourceFactory(
        config: Config.discovery.listen,
        controller: DiscoveryController(discovery: service),
      ),
    );

    DiscoveryTimeoutService(
      eventSource: eventBus,
      discovery: service,
      timeout: Config.discovery.timeout,
    );

    DiscoveryProcessLifecycleService(
      eventSource: AppLifecycle.instance.eventBus,
      process: processService,
    );
  }
}
