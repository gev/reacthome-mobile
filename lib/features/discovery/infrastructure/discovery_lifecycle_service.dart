import 'dart:async';

import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/connectivity/connectivity_api.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryLifecycleService extends GenericBusListener<AppLifecycleEvent> {
  final DiscoveryApi discovery;
  final ConnectivityApi connectivity;
  final Duration restartTimeout;

  DiscoveryLifecycleService({
    required super.eventSource,
    required this.discovery,
    required this.connectivity,
    required this.restartTimeout,
  });

  Timer? _timer;

  @override
  void handle(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        _timer = Timer.periodic(restartTimeout, (_) {
          if (connectivity.state.hasLocalNetworks) {
            discovery.start();
          }
        });
      case AppLifecycleEvent.inactive:
        _timer?.cancel();
        discovery.stop();
    }
  }
}
