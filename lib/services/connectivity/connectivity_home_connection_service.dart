import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/connectivity/connectivity_event.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';

class ConnectivityHomeConnectionService extends BusListener<ConnectivityEvent> {
  final HomeConnectionApi connection;
  final HomeApi home;

  ConnectivityHomeConnectionService({
    required super.eventSource,
    required this.home,
    required this.connection,
  });

  @override
  void handle(ConnectivityEvent event) {
    if (!event.connectivity.hasLocalNetworks) {
      connection.disconnectLocalAll();
    }
    if (!event.connectivity.hasMobile) {
      connection.disconnectCloudAll();
    }
  }
}
