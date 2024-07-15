import 'package:reacthome/features/application/discovery/discovery_api.dart';
import 'package:reacthome/features/application/discovery/discovery_event.dart';
import 'package:reacthome/features/application/discovery/discovery_state.dart';
import 'package:reacthome/features/domain/home/home_api.dart';

class DiscoveryViewModel {
  final Stream<DiscoveryEvent> eventSource;
  final DiscoveryApi discovery;
  final HomeApi discoveredHome;
  final HomeApi knownHome;

  const DiscoveryViewModel({
    required this.eventSource,
    required this.discovery,
    required this.discoveredHome,
    required this.knownHome,
  });

  bool get initialState => discovery.state == DiscoveryState.running;

  Stream<bool> get stream =>
      eventSource.map((event) => event is DiscoveryStartCompletedEvent);

  void toggleDiscovery(bool value) {
    if (value) {
      discovery.start();
    } else {
      discovery.stop();
    }
  }

  bool tryAddHome(String id) {
    final home = discoveredHome.getHomeById(id);
    if (home == null) {
      return false;
    }
    knownHome.addHome(
      id: id,
      meta: home.meta,
      address: home.address,
      project: home.project,
    );
    return true;
  }
}
