import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_query.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_command.dart';
import 'package:reacthome/util/event_listener.dart';
import 'package:reacthome/util/extensions.dart';

class ConnectionViewModel extends GenericEventListener<ConnectionEvent>
    with ChangeNotifier {
  final ({
    ConnectionQuery<DaemonConnection> query,
    DaemonConnectionCommand actor,
  }) daemonConnection;
  final ({
    ConnectionQuery<Connection> query,
  }) local;
  final ({
    ConnectionQuery<Connection> query,
  }) cloud;
  final ({DaemonQuery query}) daemon;

  ConnectionViewModel({
    required super.eventSource,
    required this.daemonConnection,
    required this.local,
    required this.cloud,
    required this.daemon,
  });

  bool isConnected(String id) =>
      daemonConnection.query.getConnectionById(id).connection?.state ==
      ConnectionState.connected;

  bool isLocalConnected(String id) =>
      local.query.getConnectionById(id).state == ConnectionState.connected;

  bool isCloudConnected(String id) =>
      cloud.query.getConnectionById(id).state == ConnectionState.connected;

  void Function(bool) toggleConnection(String id) =>
      (bool value) => daemon.query.getDaemonById(id)?.let((it) {
            if (value) {
              daemonConnection.actor.connect(it);
            } else {
              daemonConnection.actor.disconnect(id);
            }
          });

  void Function(bool) toggleLocalConnection(String id) =>
      (bool value) => daemon.query.getDaemonById(id)?.let((it) {
            if (value) {
              daemonConnection.actor.connectLocal(it);
            } else {
              daemonConnection.actor.disconnectLocal(id);
            }
          });

  void Function(bool) toggleCloudConnection(String id) =>
      (bool value) => daemon.query.getDaemonById(id)?.let((it) {
            if (value) {
              daemonConnection.actor.connectCloud(it);
            } else {
              daemonConnection.actor.disconnectCloud(id);
            }
          });

  @override
  void handle(ConnectionEvent event) {
    switch (event) {
      case ConnectSelectedEvent _:
      case ConnectCompletedEvent _:
      case DisconnectCompletedEvent _:
        notifyListeners();
      default:
    }
  }
}
