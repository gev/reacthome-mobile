import 'dart:async';

import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/connectivity/connectivity_api.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/util/bus_listener.dart';

class HomeConnectionLifecycleService
    extends GenericBusListener<AppLifecycleEvent> {
  final HomeApi home;
  final HomeConnectionApi connection;
  final ConnectivityApi connectivity;
  final Duration reconnectTimeout;

  Timer? _interval;

  HomeConnectionLifecycleService({
    required super.eventSource,
    required this.home,
    required this.connection,
    required this.connectivity,
    this.reconnectTimeout = const Duration(seconds: 5),
  });

  @override
  void handle(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        _interval = Timer.periodic(reconnectTimeout, (_) {
          if (connectivity.state.hasLocalNetworks) {
            connection.connectLocalAll(home.getAllHomes());
          }
          if (connectivity.state.hasMobile) {
            connection.connectCloudAll(home.getAllHomes());
          }
        });
      case AppLifecycleEvent.inactive:
        _interval?.cancel();
        connection.disconnectAll();
    }
  }
}
