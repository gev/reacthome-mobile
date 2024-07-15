import 'package:reacthome/features/application/connectivity/connectivity_event.dart';
import 'package:reacthome/features/application/home_connection/home_connection_api.dart';
import 'package:reacthome/features/domain/home/home_api.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';

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
