import 'dart:async';

import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_type.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';

class ActiveConnectionService extends BusListener<ConnectionEvent> {
  final HomeConnectionApi connectionApi;

  ActiveConnectionService({
    required super.eventSource,
    required this.connectionApi,
  });

  @override
  void handle(ConnectionEvent event) {
    switch (event) {
      case ConnectCompletedEvent e:
        _activateConnection(e.id);
      case DisconnectCompletedEvent e:
        _activateConnection(e.id);
      case ConnectSelectedEvent e:
        _deactivateConnection(e.id, e.type);
      default:
    }
  }

  void _activateConnection(String id) {
    connectionApi.select(id);
  }

  void _deactivateConnection(String id, ConnectionType type) {
    Timer(
      const Duration(seconds: 1),
      () {
        switch (type) {
          case ConnectionType.local:
            connectionApi.disconnectCloud(id);
          case ConnectionType.cloud:
            connectionApi.disconnectLocal(id);
        }
      },
    );
  }
}
