import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/daemon/daemon_api.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_api.dart';
import 'package:reacthome/util/event_listener.dart';
import 'package:reacthome/util/extensions.dart';

class ConnectionViewModel<S> extends GenericEventListener<ConnectionEvent>
    with ChangeNotifier {
  final DaemonConnectionApi daemonConnection;
  final LocalConnectionApi<S> local;
  final CloudConnectionApi<S> cloud;
  final DaemonApi daemon;

  ConnectionViewModel({
    required super.eventSource,
    required this.daemonConnection,
    required this.local,
    required this.cloud,
    required this.daemon,
  });

  bool isConnected(String id) =>
      daemonConnection.getConnectionById(id).connection?.state ==
      ConnectionState.connected;

  bool isLocalConnected(String id) =>
      local.getConnectionById(id).state == ConnectionState.connected;

  bool isCloudConnected(String id) =>
      cloud.getConnectionById(id).state == ConnectionState.connected;

  void Function(bool) toggleConnection(String id) =>
      (bool value) => daemon.getDaemonById(id)?.let((it) {
            if (value) {
              daemonConnection.connect(it);
            } else {
              daemonConnection.disconnect(id);
            }
          });

  void Function(bool) toggleLocalConnection(String id) =>
      (bool value) => daemon.getDaemonById(id)?.let((it) {
            if (value) {
              daemonConnection.connectLocal(it);
            } else {
              daemonConnection.disconnectLocal(id);
            }
          });

  void Function(bool) toggleCloudConnection(String id) =>
      (bool value) => daemon.getDaemonById(id)?.let((it) {
            if (value) {
              daemonConnection.connectCloud(it);
            } else {
              daemonConnection.disconnectCloud(id);
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

  @override
  void dispose() {
    cancelSubscription();
    super.dispose();
  }
}
