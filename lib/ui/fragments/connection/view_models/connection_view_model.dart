import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/util/bus_listener.dart';
import 'package:reacthome/util/extensions.dart';

class ConnectionViewModel<S> extends GenericBusListener<ConnectionEvent>
    with ChangeNotifier {
  final HomeConnectionApi homeConnection;
  final LocalConnectionApi<S> local;
  final CloudConnectionApi<S> cloud;
  final HomeApi home;

  ConnectionViewModel({
    required super.eventSource,
    required this.homeConnection,
    required this.local,
    required this.cloud,
    required this.home,
  });

  bool isConnected(String id) =>
      homeConnection.getConnectionById(id).connection?.state ==
      ConnectionState.connected;

  bool isLocalConnected(String id) =>
      local.getConnectionById(id).state == ConnectionState.connected;

  bool isCloudConnected(String id) =>
      cloud.getConnectionById(id).state == ConnectionState.connected;

  void Function(bool) toggleConnection(String id) =>
      (bool value) => home.getHomeById(id)?.let((it) {
            if (value) {
              homeConnection.connect(it);
            } else {
              homeConnection.disconnect(id);
            }
          });

  void Function(bool) toggleLocalConnection(String id) =>
      (bool value) => home.getHomeById(id)?.let((it) {
            if (value) {
              homeConnection.connectLocal(it);
            } else {
              homeConnection.disconnectLocal(id);
            }
          });

  void Function(bool) toggleCloudConnection(String id) =>
      (bool value) => home.getHomeById(id)?.let((it) {
            if (value) {
              homeConnection.connectCloud(it);
            } else {
              homeConnection.disconnectCloud(id);
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
