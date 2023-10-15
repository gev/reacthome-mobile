import 'package:reacthome/domains/discovery/discovery_model.dart';
import 'package:reacthome/domains/discovery/discovery_event.dart';
export 'package:reacthome/domains/discovery/discovery_event.dart';
import 'package:reacthome/domains/discovery/discovery_state.dart';
export 'package:reacthome/domains/discovery/discovery_state.dart';
import 'package:reacthome/utils/event_bus.dart';

class DiscoveryService {
  final EventBus<DiscoveryEvent> eventBus;
  final DiscoveryModel model;

  DiscoveryService(this.eventBus, this.model);

  DiscoveryState get state => model.state;
  int get counter => model.counter;

  void start() => model.start(eventBus.emit);

  void run() => model.run();

  void stop() => model.stop(eventBus.emit);

  void increment() => model.increment(eventBus.emit);
}
