import 'package:reacthome/application/connectivity/connectivity_event.dart';
import 'package:reacthome/application/home_connection/home_connection_api.dart';
import 'package:reacthome/domain/home/home_api.dart';
import 'package:reacthome/entity_framework/infrastructure/bus/bus_listener.dart';

class HomeConnectionConnectivityService extends BusListener<ConnectivityEvent> {
  final HomeConnectionApi connection;
  final HomeApi home;

  HomeConnectionConnectivityService({
    required super.eventSource,
    required this.home,
    required this.connection,
  });

  @override
  void handle(ConnectivityEvent event) {
    if (!event.state.hasLocalNetworks) {
      connection.disconnectLocalAll();
    }
    if (!event.state.hasMobile) {
      connection.disconnectCloudAll();
    }
  }
}
