import 'package:reacthome/app/app_life_cycle.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/discovery.dart';
import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/features/discovery_process/application/discovery_process_lifecycle_service.dart';
import 'package:reacthome/features/discovery_process/application/discovery_process_service.dart';
import 'package:reacthome/features/discovery_process/infrastructure/discovery_process_repository.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/bus.dart';

class DiscoveryProcess {
  static final instance = DiscoveryProcess._();

  late Bus<DiscoveryProcessEvent> eventBus = Bus<DiscoveryProcessEvent>();
  late DiscoveryProcessService service;

  DiscoveryProcess._() {
    eventBus = Bus<DiscoveryProcessEvent>();
    service = DiscoveryProcessService(
      eventSink: eventBus,
      repository: DiscoveryProcessRepository(
        factory: MulticastSourceFactory(
          config: Config.discovery,
          controller: Discovery.instance.controller,
        ),
      ),
    );

    DiscoveryProcessLifecycleService(
      eventSource: AppLifecycle.instance.eventBus,
      process: service,
    );
  }
}
