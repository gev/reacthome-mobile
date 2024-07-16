import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';

class DiscoveryHomeUpdateService extends BusListener<HomeEvent> {
  final HomeApi home;

  DiscoveryHomeUpdateService({
    required super.eventSource,
    required this.home,
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
      case HomeRenewEvent e:
        _update(e.home);
      default:
    }
  }

  void _update(Home discoveredHome) {
    home.updateHome(
      discoveredHome.id,
      meta: discoveredHome.meta,
      project: discoveredHome.project,
      address: discoveredHome.address,
    );
  }
}
