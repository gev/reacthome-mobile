import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/connectivity/connectivity_event.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';

class ConnectivityDiscoveryService extends BusListener<ConnectivityEvent> {
  final DiscoveryApi discoveryApi;

  ConnectivityDiscoveryService({
    required super.eventSource,
    required this.discoveryApi,
  });

  @override
  void handle(ConnectivityEvent event) {
    if (event.connectivity.hasLocalNetworks) {
      discoveryApi.start();
    } else {
      discoveryApi.stop();
    }
  }
}
