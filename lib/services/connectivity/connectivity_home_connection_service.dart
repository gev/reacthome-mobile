import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/connectivity/connectivity_event.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';

class ConnectivityHomeConnectionService extends BusListener<ConnectivityEvent> {
  final HomeConnectionApi connectionApi;
  final HomeApi homeApi;

  ConnectivityHomeConnectionService({
    required super.eventSource,
    required this.homeApi,
    required this.connectionApi,
  });

  @override
  void handle(ConnectivityEvent event) {
    if (!event.connectivity.hasLocalNetworks) {
      connectionApi.disconnectLocalAll();
    }
    if (!event.connectivity.hasMobile) {
      connectionApi.disconnectCloudAll();
    }
  }
}
