import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/util/bus_listener.dart';
import 'package:reacthome/util/extensions.dart';

class HomeConnectionAutoService extends GenericBusListener<HomeEvent> {
  final HomeApi home;
  final HomeConnectionApi connection;

  HomeConnectionAutoService({
    required super.eventSource,
    required this.home,
    required this.connection,
  });

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeAddedEvent e:
        home.getHomeById(e.home)?.let(connection.connect);
      default:
    }
  }
}
