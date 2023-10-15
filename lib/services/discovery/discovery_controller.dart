import 'package:reacthome/services/discovery/discovery_service.dart';
import 'package:reacthome/services/discovery/discovery_socket_fabric.dart';
import 'package:reacthome/utils/event_bus.dart';

class DiscoveryController with EventHandler<DiscoveryEvent> {
  final DiscoveryService discovery;
  final DiscoverySocketFabric fabric;

  DiscoverySocket? _socket;

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
