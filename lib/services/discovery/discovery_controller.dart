import 'package:reacthome/services/discovery/discovery_service.dart';
import 'package:reacthome/utils/closable.dart';
import 'package:reacthome/utils/event_bus.dart';
import 'package:reacthome/utils/fabric.dart';

class DiscoveryController with EventHandler<DiscoveryEvent> {
  final DiscoveryService discovery;
  final AsyncFabric fabric;

  Closable? _socket;

  DiscoveryController(this.discovery, this.fabric);

  @override
  void handleEvent(DiscoveryEvent event) {
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
    _socket = await fabric.create();
    discovery.run();
  }

  void _stop() => _socket?.close();
}
