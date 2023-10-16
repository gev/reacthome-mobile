import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/features/discovery/discovery_model.dart';
import 'package:reacthome/util/closable.dart';
import 'package:reacthome/util/event_listener.dart';
import 'package:reacthome/util/fabric.dart';

class DiscoveryController with EventListener<DiscoveryEvent> {
  final DiscoveryModel discoveryModel;
  final AsyncFabric<Closable> discoverySourceFabric;

  Closable? _discoverySource;

  DiscoveryController(this.discoveryModel, this.discoverySourceFabric);

  @override
  void onData(DiscoveryEvent event) {
    switch (event) {
      case DiscoveryEventStart _:
        _start();
      case DiscoveryEventStop _:
        _stop();
      default:
        break;
    }
  }

  void _start() async {
    _discoverySource = await discoverySourceFabric.create();
    discoveryModel.run();
  }

  void _stop() => _discoverySource?.close();

  @override
  void dispose() => _stop();
}
