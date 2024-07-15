import 'dart:async';

import 'package:reacthome/application/connection/connection_event.dart';
import 'package:reacthome/application/connection/connection_type.dart';
import 'package:reacthome/application/home_connection/home_connection_api.dart';
import 'package:reacthome/entity_framework/infrastructure/bus/bus_listener.dart';

class ActiveConnectionService extends BusListener<ConnectionEvent> {
  final HomeConnectionApi connection;

  ActiveConnectionService({
    required super.eventSource,
    required this.connection,
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
    connection.select(id);
  }

  void _deactivateConnection(String id, ConnectionType type) {
    Timer(
      const Duration(seconds: 1),
      () {
        switch (type) {
          case ConnectionType.local:
            connection.disconnectCloud(id);
          case ConnectionType.cloud:
            connection.disconnectLocal(id);
        }
      },
    );
  }
}
