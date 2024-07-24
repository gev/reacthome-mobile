import 'dart:async';

import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/connectivity/connectivity_api.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';

class DiscoveryLifecycleService extends BusListener<AppLifecycleEvent> {
  final DiscoveryApi discoveryApi;
  final ConnectivityApi connectivityApi;
  final Duration restartTimeout;

  DiscoveryLifecycleService({
    required super.eventSource,
    required this.discoveryApi,
    required this.connectivityApi,
    required this.restartTimeout,
  });

  Timer? _timer;

  @override
  void handle(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        _timer = Timer.periodic(restartTimeout, (_) {
          if (connectivityApi.state.hasLocalNetworks) {
            discoveryApi.start();
          }
        });
      case AppLifecycleEvent.inactive:
        _timer?.cancel();
        discoveryApi.stop();
    }
  }
}
