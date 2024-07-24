import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';

class DiscoveryHomeUpdateService extends BusListener<HomeEvent> {
  final HomeApi myHomeApi;
  final HomeApi discoveredHomeApi;

  DiscoveryHomeUpdateService({
    required super.eventSource,
    required this.myHomeApi,
    required this.discoveredHomeApi,
  });

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeMetaChangedEvent e:
        _update(e.id);
      case HomeAddressChangedEvent e:
        _update(e.id);
      case HomeProjectChangedEvent e:
        _update(e.id);
      case HomeRenewEvent e:
        _update(e.id);
      default:
    }
  }

  void _update(String id) {
    final home = discoveredHomeApi.getHomeById(id);
    if (home != null) {
      myHomeApi.updateHome(
        id,
        meta: home.meta,
        project: home.project,
        address: home.address,
      );
    }
  }
}
