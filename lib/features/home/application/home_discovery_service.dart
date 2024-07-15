import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/util/bus/bus_listener.dart';

class HomeDiscoveryService extends GenericBusListener<HomeEvent> {
  final HomeApi discovered;
  final HomeApi known;
  final HomeConnectionApi connection;

  HomeDiscoveryService({
    required super.eventSource,
    required this.discovered,
    required this.known,
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

  void _update(String id) {
    final discoveredHome = discovered.getHomeById(id)!;
    final knownHome = known.getHomeById(id);
    final shouldReconnect =
        knownHome != null && knownHome.address != discoveredHome.address;
    known.updateHome(
      id: id,
      meta: discoveredHome.meta,
      project: discoveredHome.project,
      address: discoveredHome.address,
    );
    if (shouldReconnect) {
      connection.disconnectLocal(id);
      connection.connectLocal(knownHome);
    }
  }
}
