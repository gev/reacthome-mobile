import 'package:flutter/widgets.dart';
import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';
import 'package:reacthome/ui/dto/connection_ui_dto.dart';
import 'package:reacthome/ui/dto/home_connection_ui_dto.dart';
import 'package:reacthome/util/extensions.dart';

class ConnectionViewModel<S> extends BusListener<ConnectionEvent>
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
      ConnectionUiDto(homeConnection.getConnectionById(id).connection)
          .isConnected;

  bool isLocalConnected(String id) =>
      ConnectionUiDto(local.getConnectionById(id)).isConnected;

  bool isCloudConnected(String id) =>
      ConnectionUiDto(cloud.getConnectionById(id)).isConnected;

  HomeConnectionUiDto getConnectionState(String id) => HomeConnectionUiDto(
        isConnected: isConnected(id),
        isLocalConnected: isLocalConnected(id),
        isCloudConnected: isCloudConnected(id),
      );

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
}
