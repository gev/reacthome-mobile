import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';

class ReconnectLocalService extends BusListener<HomeEvent> {
  final HomeConnectionApi connectionApi;

  ReconnectLocalService({
    required super.eventSource,
    required this.connectionApi,
  });

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeAddressChangedEvent e:
        _reconnect(e.id);
      default:
    }
  }

  void _reconnect(String id) {
    connectionApi.disconnectLocal(id);
    connectionApi.connectLocal(id);
  }
}
