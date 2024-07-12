import 'package:reacthome/core/connectivity/connectivity_event.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryConnectivityService
    extends GenericBusListener<ConnectivityEvent> {
  final DiscoveryApi discovery;

  DiscoveryConnectivityService({
    required super.eventSource,
    required this.discovery,
  });

  @override
  void handle(ConnectivityEvent event) {
    if (event.state.hasEthernet || event.state.hasWifi) {
      discovery.start();
    } else {
      discovery.stop();
    }
  }
}
