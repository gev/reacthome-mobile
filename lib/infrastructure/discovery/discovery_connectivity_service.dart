import 'package:reacthome/application/connectivity/connectivity_event.dart';
import 'package:reacthome/application/discovery/discovery_api.dart';
import 'package:reacthome/entity_framework/infrastructure/bus/bus_listener.dart';

class DiscoveryConnectivityService extends BusListener<ConnectivityEvent> {
  final DiscoveryApi discovery;

  DiscoveryConnectivityService({
    required super.eventSource,
    required this.discovery,
  });

  @override
  void handle(ConnectivityEvent event) {
    if (event.state.hasLocalNetworks) {
      discovery.start();
    } else {
      discovery.stop();
    }
  }
}
