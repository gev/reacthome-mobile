import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';

class ConnectionHomeRegistryService extends BusListener<HomeEvent> {
  final HomeApi homeApi;
  final HomeConnectionApi connectionApi;

  ConnectionHomeRegistryService({
    required super.eventSource,
    required this.homeApi,
    required this.connectionApi,
  });

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeAddedEvent e:
        connectionApi.connect(e.id);
      case HomeRemovedEvent e:
        connectionApi.disconnect(e.id);
      default:
    }
  }
}
