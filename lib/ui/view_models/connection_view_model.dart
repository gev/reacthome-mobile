import 'package:reacthome/common/view_model.dart';
import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/ui/dto/connection_ui_dto.dart';
import 'package:reacthome/ui/dto/home_connection_ui_dto.dart';
import 'package:reacthome/util/extensions.dart';

class ConnectionsViewModel<S> {
  final Stream<ConnectionEvent> eventSource;
  final HomeConnectionApi homeConnection;
  final LocalConnectionApi<S> local;
  final CloudConnectionApi<S> cloud;
  final HomeApi home;

  ConnectionsViewModel({
    required this.eventSource,
    required this.homeConnection,
    required this.local,
    required this.cloud,
    required this.home,
  });

  ConnectionViewModel<S> makeConnectionViewModel(String id) =>
      ConnectionViewModel(id, homeConnection, local, cloud, home,
          eventSource: eventSource);
}

class ConnectionViewModel<S> extends ViewModel<ConnectionEvent> {
  final HomeConnectionApi homeConnection;
  final LocalConnectionApi<S> local;
  final CloudConnectionApi<S> cloud;
  final HomeApi home;
  final String id;

  ConnectionViewModel(
      this.id, this.homeConnection, this.local, this.cloud, this.home,
      {required super.eventSource});

  bool get isConnected =>
      ConnectionUiDto(homeConnection.getConnectionById(id).connection)
          .isConnected;

  bool get isLocalConnected =>
      ConnectionUiDto(local.getConnectionById(id)).isConnected;

  bool get isCloudConnected =>
      ConnectionUiDto(cloud.getConnectionById(id)).isConnected;

  HomeConnectionUiDto getConnectionState(String id) =>
      HomeConnectionUiDto(isConnected, isLocalConnected, isCloudConnected);

  void toggleConnection(bool value) => home.getHomeById(id)?.let((it) {
        if (value) {
          homeConnection.connect(it);
        } else {
          homeConnection.disconnect(id);
        }
      });

  void toggleLocalConnection(bool value) => home.getHomeById(id)?.let((it) {
        if (value) {
          homeConnection.connectLocal(it);
        } else {
          homeConnection.disconnectLocal(id);
        }
      });

  void toggleCloudConnection(bool value) => home.getHomeById(id)?.let((it) {
        if (value) {
          homeConnection.connectCloud(it);
        } else {
          homeConnection.disconnectCloud(id);
        }
      });

  @override
  bool shouldNotify(ConnectionEvent event) =>
      event.id == id &&
      (event is ConnectSelectedEvent ||
          event is ConnectCompletedEvent ||
          event is DisconnectCompletedEvent);
}
