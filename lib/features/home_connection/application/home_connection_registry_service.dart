import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';

class HomeConnectionRegistryService extends GenericBusListener<HomeEvent> {
  final HomeApi home;
  final HomeConnectionApi connection;

  HomeConnectionRegistryService({
    required super.eventSource,
    required this.home,
    required this.connection,
  });

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeAddedEvent e:
        connection.connect(e.home);
      case HomeRemovedEvent e:
        connection.disconnect(e.home.id);
      default:
    }
  }
}
