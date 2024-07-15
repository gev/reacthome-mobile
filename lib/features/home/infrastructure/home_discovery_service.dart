import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';

class HomeDiscoveryService extends BusListener<HomeEvent> {
  final HomeApi home;
  final HomeConnectionApi connection;

  HomeDiscoveryService({
    required super.eventSource,
    required this.home,
    required this.connection,
  });

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeMetaChangedEvent e:
        _update(e.home);
      case HomeAddressChangedEvent e:
        _update(e.home);
      case HomeProjectChangedEvent e:
        _update(e.home);
      default:
    }
  }

  // TODO: move to a usecase
  void _update(Home discoveredHome) {
    final knownHome = home.getHomeById(discoveredHome.id);
    final shouldReconnect =
        knownHome != null && knownHome.address != discoveredHome.address;
    home.updateHome(
      id: discoveredHome.id,
      meta: discoveredHome.meta,
      project: discoveredHome.project,
      address: discoveredHome.address,
    );
    if (shouldReconnect) {
      connection.disconnectLocal(discoveredHome.id);
      connection.connectLocal(knownHome);
    }
  }
}
