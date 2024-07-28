import 'dart:async';

import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/connectivity/connectivity_api.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';

class AppLifecycleHomeConnectionService extends BusListener<AppLifecycleEvent> {
  final HomeApi homeApi;
  final HomeConnectionApi connectionApi;
  final ConnectivityApi connectivityApi;
  final Duration reconnectTimeout;

  Timer? _timer;

  AppLifecycleHomeConnectionService({
    required super.eventSource,
    required this.homeApi,
    required this.connectionApi,
    required this.connectivityApi,
    required this.reconnectTimeout,
  });

  @override
  void handle(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        _timer = Timer.periodic(reconnectTimeout, (_) {
          if (connectivityApi.state.hasLocalNetworks) {
            connectionApi.connectAll(homeApi.homes);
          } else if (connectivityApi.state.hasMobile) {
            connectionApi.connectCloudAll(homeApi.homes);
          }
        });
      case AppLifecycleEvent.inactive:
        _timer?.cancel();
        connectionApi.disconnectAll();
    }
  }
}
