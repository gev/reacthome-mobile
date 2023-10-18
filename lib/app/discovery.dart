import 'package:reacthome/app/app_life_cycle.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/features/discovery/discovery_actor.dart';
import 'package:reacthome/features/discovery/discovery_controller.dart';
import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/features/discovery/discovery_life_cycle.dart';
import 'package:reacthome/features/discovery/discovery_repository.dart';
import 'package:reacthome/features/discovery/discovery_service.dart';
import 'package:reacthome/features/discovery/discovery_state.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/bus.dart';

class Discovery {
  static final instance = Discovery._();

  late Bus<DiscoveryEvent> eventBus = Bus<DiscoveryEvent>();
  late DiscoveryService service;

  Discovery._() {
    eventBus = Bus<DiscoveryEvent>();
    final commandBus = Bus<DiscoveryState>();
    final repository = DiscoveryRepository(commandSource: commandBus);
    service = DiscoveryService(repository, eventSink: eventBus);
    DiscoveryController(
      service,
      eventSource: eventBus,
      commandSink: commandBus,
      factory: MulticastSourceFactory(
        Config.discovery,
        DiscoveryActor(service),
      ),
    );
    DiscoveryLifeCycle(service, eventSource: AppLifecycle.instance.eventBus);
  }
}
