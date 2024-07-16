import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';

class ReconnectLocalService extends BusListener<HomeEvent> {
  final HomeConnectionApi connection;

  ReconnectLocalService({
    required super.eventSource,
    required this.connection,
  });

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeAddressChangedEvent e:
        _reconnect(e.home);
      default:
    }
  }

  void _reconnect(Home home) {
    connection.disconnectLocal(home.id);
    connection.connectLocal(home);
  }
}
