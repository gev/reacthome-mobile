import 'package:reacthome/common/view_model.dart';
import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/ui/dto/connection_ui_dto.dart';
import 'package:reacthome/ui/dto/home_connection_ui_dto.dart';

class ConnectionsViewModel<S> {
  final Stream<ConnectionEvent> eventSource;
  final HomeConnectionApi homeConnectionApi;
  final LocalConnectionApi<S> localConnectionApi;
  final CloudConnectionApi<S> cloudConnectionApi;
  final HomeApi homeApi;

  ConnectionsViewModel({
    required this.eventSource,
    required this.homeConnectionApi,
    required this.localConnectionApi,
    required this.cloudConnectionApi,
    required this.homeApi,
  });

  ConnectionViewModel<S> makeConnectionViewModel(String id) =>
      ConnectionViewModel(id, homeConnectionApi, localConnectionApi,
          cloudConnectionApi, homeApi,
          eventSource: eventSource);
}

class ConnectionViewModel<S> extends ViewModel<ConnectionEvent> {
  final HomeConnectionApi homeConnectionApi;
  final LocalConnectionApi<S> local;
  final CloudConnectionApi<S> cloud;
  final HomeApi home;
  final String id;

  ConnectionViewModel(
      this.id, this.homeConnectionApi, this.local, this.cloud, this.home,
      {required super.eventSource});

  bool get isConnected =>
      ConnectionUiDto(homeConnectionApi.getConnectionById(id).connection)
          .isConnected;

  bool get isLocalConnected =>
      ConnectionUiDto(local.getConnectionById(id)).isConnected;

  bool get isCloudConnected =>
      ConnectionUiDto(cloud.getConnectionById(id)).isConnected;

  HomeConnectionUiDto getConnectionState(String id) =>
      HomeConnectionUiDto(isConnected, isLocalConnected, isCloudConnected);

  void toggleConnection(bool value) {
    if (value) {
      homeConnectionApi.connect(id);
    } else {
      homeConnectionApi.disconnect(id);
    }
  }

  void toggleLocalConnection(bool value) {
    if (value) {
      homeConnectionApi.connectLocal(id);
    } else {
      homeConnectionApi.disconnectLocal(id);
    }
  }

  void toggleCloudConnection(bool value) {
    if (value) {
      homeConnectionApi.connectCloud(id);
    } else {
      homeConnectionApi.disconnectCloud(id);
    }
  }

  @override
  bool shouldNotify(ConnectionEvent event) =>
      event.id == id &&
      (event is ConnectSelectedEvent ||
          event is ConnectCompletedEvent ||
          event is DisconnectCompletedEvent);
}
