import 'package:reacthome/core/connectivity/connectivity_event.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/util/bus_listener.dart';

class HomeConnectionConnectivityService
    extends GenericBusListener<ConnectivityEvent> {
  final HomeConnectionApi connection;
  final HomeApi home;

  HomeConnectionConnectivityService({
    required super.eventSource,
    required this.home,
    required this.connection,
  });

  @override
  void handle(ConnectivityEvent event) {
    switch (event) {
      case ConnectivityConnectedEvent e:
        if (!e.state.hasEthernet && !e.state.hasWifi) {
          connection.disconnectLocalAll();
          connection.connectCloudAll(home.getAllHomes());
        } else {
          connection.connectAll(home.getAllHomes());
        }
      case ConnectivityDisconnectedEvent _:
        connection.disconnectAll();
    }
  }
}
