import 'package:flutter/widgets.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';

class DiscoveryViewModel extends BusListener<DiscoveryEvent>
    with ChangeNotifier {
  final DiscoveryApi discovery;
  final HomeApi discoveredHome;
  final HomeApi knownHome;

  DiscoveryViewModel({
    required super.eventSource,
    required this.discovery,
    required this.discoveredHome,
    required this.knownHome,
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
    final home = discoveredHome.getHomeById(id);
    if (home == null) {
      return false;
    }
    knownHome.addHome(
      id,
      meta: home.meta,
      address: home.address,
      project: home.project,
    );
    return true;
  }

  @override
  void handle(DiscoveryEvent event) {
    notifyListeners();
  }
}
