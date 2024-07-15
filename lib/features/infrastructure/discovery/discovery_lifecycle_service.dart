import 'dart:async';

import 'package:reacthome/features/application/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/features/application/connectivity/connectivity_api.dart';
import 'package:reacthome/features/application/discovery/discovery_api.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';

class DiscoveryLifecycleService extends BusListener<AppLifecycleEvent> {
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
