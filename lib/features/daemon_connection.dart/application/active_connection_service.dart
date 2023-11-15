import 'package:reacthome/core/connection/connection_command.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_type.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_command.dart';
import 'package:reacthome/util/event_listener.dart';

class ActiveConnectionService extends EventListener<ConnectionEvent> {
  final ({DaemonConnectionCommand actor}) connection;
  final ({LocalConnectionCommand actor}) local;
  final ({CloudConnectionCommand actor}) cloud;

  ActiveConnectionService({
    required super.eventSource,
    required this.connection,
    required this.local,
    required this.cloud,
  });

  @override
  void handle(ConnectionEvent event) {
    switch (event) {
      case ConnectCompletedEvent e:
        _activateConnection(e.id);
      case DisconnectCompletedEvent e:
        _activateConnection(e.id);
      case ActiveConnectChangedEvent e:
        _deactivateConnection(e.id, e.type);
      default:
    }
  }

  void _activateConnection(String id) {
    connection.actor.selectActive(id);
  }

  void _deactivateConnection(String id, ConnectionType type) {
    switch (type) {
      case ConnectionType.local:
        cloud.actor.disconnect(id);
      case ConnectionType.cloud:
        local.actor.disconnect(id);
    }
  }
}
