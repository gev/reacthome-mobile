import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/ui/dto.dart';
import 'package:reacthome/util/extensions.dart';

class ConnectionViewModel<S> {
  final Stream<ConnectionEvent> eventSource;
  final HomeConnectionApi homeConnection;
  final LocalConnectionApi<S> local;
  final CloudConnectionApi<S> cloud;
  final HomeApi home;

  ConnectionViewModel({
    required this.eventSource,
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

  ConnectionUI getConnectionState(String id) => (
        isConnected: isConnected(id),
        isLocalConnected: isLocalConnected(id),
        isCloudConnected: isCloudConnected(id),
      );

  Stream<ConnectionUI> stream(String id) => eventSource
      .where((event) =>
          id == event.id &&
          (event is ConnectSelectedEvent ||
              event is ConnectCompletedEvent ||
              event is DisconnectCompletedEvent))
      .map((event) => getConnectionState(id));

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
}
