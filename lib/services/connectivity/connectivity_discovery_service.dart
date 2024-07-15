import 'package:reacthome/core/connectivity/connectivity_event.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';

class ConnectivityDiscoveryService extends BusListener<ConnectivityEvent> {
  final DiscoveryApi discovery;

  ConnectivityDiscoveryService({
    required super.eventSource,
    required this.discovery,
  });

  @override
  void handle(ConnectivityEvent event) {
    if (event.connectivity.hasLocalNetworks) {
      discovery.start();
    } else {
      discovery.stop();
    }
  }
}
