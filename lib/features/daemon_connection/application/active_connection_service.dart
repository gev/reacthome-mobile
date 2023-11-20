import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_type.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_command.dart';
import 'package:reacthome/util/event_listener.dart';

class ActiveConnectionService extends GenericEventListener<ConnectionEvent> {
  final DaemonConnectionCommand actor;

  ActiveConnectionService({
    required super.eventSource,
    required this.actor,
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
    actor.select(id);
  }

  void _deactivateConnection(String id, ConnectionType type) {
    switch (type) {
      case ConnectionType.local:
        actor.disconnectCloud(id);
      case ConnectionType.cloud:
        actor.disconnectLocal(id);
    }
  }
}
