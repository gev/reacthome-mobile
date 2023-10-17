import 'package:reacthome/app/config.dart';
import 'package:reacthome/features/discovery/discovery_actor.dart';
import 'package:reacthome/features/discovery/discovery_controller.dart';
import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/features/discovery/discovery_model.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/event_bus.dart';

class Discovery {
  static final instance = Discovery._();

  late EventBus<DiscoveryEvent> eventBus;
  late DiscoveryModel model;

  Discovery._() {
    eventBus = EventBus<DiscoveryEvent>();
    model = DiscoveryModel(eventBus);
    final controller = DiscoveryController(
      model,
      MulticastSourceFactory(
        Config.discovery,
        DiscoveryActor(model),
      ),
    );
    controller.subscribe(eventBus);
  }
}