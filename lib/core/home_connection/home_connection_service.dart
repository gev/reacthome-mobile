import 'package:reacthome/common/emitter.dart';
import 'package:reacthome/common/repository.dart';
import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/core/home_connection/home_connection_entity.dart';
import 'package:reacthome/util/extensions.dart';

class HomeConnectionService<S> implements HomeConnectionApi {
  final Emitter<ConnectionEvent> eventSink;
  final LocalConnectionApi<S> localConnectionApi;
  final CloudConnectionApi<S> cloudConnectionApi;
  final HomeApi homeApi;
  final Repository<String, HomeConnectionEntity<S>> repository;

  const HomeConnectionService({
    required this.eventSink,
    required this.localConnectionApi,
    required this.cloudConnectionApi,
    required this.homeApi,
    required this.repository,
  });

  Iterable<String> get connections => repository.keys;

  @override
  HomeConnection<S> getConnectionById(String id) => _getConnectionById(id);

  @override
  void connectAll(Iterable<String> ids) => ids.forEach(connect);

  @override
  void connect(String id) {
    connectLocal(id);
    connectCloud(id);
  }

  @override
  void connectLocalAll(Iterable<String> ids) => ids.forEach(connectLocal);

  @override
  void connectLocal(String id) {
    final home = homeApi.getHomeById(id);
    final address = home?.address;
    if (address != null) {
      localConnectionApi.connect(id, address);
    }
  }

  @override
  void connectCloudAll(Iterable<String> ids) => ids.forEach(connectCloud);

  @override
  void connectCloud(String id) {
    final connection = localConnectionApi.getConnectionById(id);
    if (connection.state != ConnectionState.connected) {
      cloudConnectionApi.connect(id);
    }
  }

  @override
  void disconnectAll() => connections.forEach(disconnect);

  @override
  void disconnect(String id) {
    disconnectLocal(id);
    disconnectCloud(id);
  }

  @override
  void disconnectLocalAll() => connections.forEach(disconnectLocal);

  @override
  void disconnectLocal(String id) {
    localConnectionApi.disconnect(id);
  }

  @override
  void disconnectCloudAll() => connections.forEach(disconnectCloud);

  @override
  void disconnectCloud(String id) {
    cloudConnectionApi.disconnect(id);
  }

  @override
  void select(String id) => _getConnectionById(id)
      .select(
        localConnectionApi.getConnectionById(id),
        cloudConnectionApi.getConnectionById(id),
      )
      ?.let(eventSink.emit);

  HomeConnectionEntity<S> _getConnectionById(String id) {
    var connection = repository.get(id);
    if (connection == null) {
      connection = HomeConnectionEntity<S>(id);
      repository.put(connection);
    }
    return connection;
  }
}
