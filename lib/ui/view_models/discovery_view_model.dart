import 'package:reacthome/common/view_model.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';
import 'package:reacthome/core/home/home_api.dart';

class DiscoveryViewModel extends ViewModel<DiscoveryEvent> {
  final DiscoveryApi discovery;
  final HomeApi discoveredHomeApi;
  final HomeApi myHomeApi;

  DiscoveryViewModel({
    required super.eventSource,
    required this.discovery,
    required this.discoveredHomeApi,
    required this.myHomeApi,
  });

  bool get state => discovery.state == DiscoveryState.running;

  void toggleDiscovery(bool value) {
    if (value) {
      discovery.start();
    } else {
      discovery.stop();
    }
  }

  bool tryAddHome(String id) {
    final home = discoveredHomeApi.getHomeById(id);
    if (home == null) {
      return false;
    }
    myHomeApi.addHome(
      id,
      meta: home.meta,
      address: home.address,
      project: home.project,
    );
    return true;
  }

  @override
  bool shouldNotify(DiscoveryEvent event) => true;
}
