import 'package:reacthome/app/app_life_cycle.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/discovery.dart';
import 'package:reacthome/features/discovery_process/application/discovery_process_controller.dart';
import 'package:reacthome/features/discovery_process/application/discovery_process_lifecycle.dart';
import 'package:reacthome/features/discovery_process/application/discovery_process_service.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_event.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_state.dart';
import 'package:reacthome/features/discovery_process/infrastructure/discovery_process_repository.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/bus.dart';

class DiscoveryProcess {
  static final instance = DiscoveryProcess._();

  late Bus<DiscoveryProcessEvent> eventBus = Bus<DiscoveryProcessEvent>();
  late DiscoveryProcessService service;

  DiscoveryProcess._() {
    eventBus = Bus<DiscoveryProcessEvent>();
    final commandBus = Bus<DiscoveryProcessState>();
    final repository = DiscoveryProcessRepository(commandSource: commandBus);
    service = DiscoveryProcessService(repository, eventSink: eventBus);
    DiscoveryProcessController(
      service,
      eventSource: eventBus,
      commandSink: commandBus,
      factory: MulticastSourceFactory(
        Config.discovery,
        Discovery.instance.controller,
      ),
    );
    DiscoveryProcessLifecycle(service,
        eventSource: AppLifecycle.instance.eventBus);
  }
}
