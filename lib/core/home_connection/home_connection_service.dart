import 'package:reacthome/common/emitter.dart';
import 'package:reacthome/common/repository.dart';
import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home_connection/home_connection.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/core/home_connection/home_connection_entity.dart';
import 'package:reacthome/util/extensions.dart';

class HomeConnectionService<S> implements HomeConnectionApi {
  final Emitter<ConnectionEvent> eventSink;
  final LocalConnectionApi<S> local;
  final CloudConnectionApi<S> cloud;
  final Repository<String, HomeConnectionEntity<S>> repository;

  const HomeConnectionService({
    required this.eventSink,
    required this.local,
    required this.cloud,
    required this.repository,
  });

  Iterable<String> get connections => repository.keys;

  @override
  HomeConnection<S> getConnectionById(String id) => _getConnectionById(id);

  @override
  void connectAll(Iterable<Home> homes) => homes.forEach(connect);

  @override
  void connect(Home home) {
    connectLocal(home);
    connectCloud(home);
  }

  @override
  void connectLocalAll(Iterable<Home> homes) => homes.forEach(connectLocal);

  @override
  void connectLocal(Home home) {
    final address = home.address;
    if (address != null) {
      local.connect(home.id, address);
    }
  }

  @override
  void connectCloudAll(Iterable<Home> homes) => homes.forEach(connectCloud);

  @override
  void connectCloud(Home home) {
    final connection = local.getConnectionById(home.id);
    if (connection.state != ConnectionState.connected) {
      cloud.connect(home.id);
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
    local.disconnect(id);
  }

  @override
  void disconnectCloudAll() => connections.forEach(disconnectCloud);

  @override
  void disconnectCloud(String id) {
    cloud.disconnect(id);
  }

  @override
  void select(String id) => _getConnectionById(id)
      .select(
        local.getConnectionById(id),
        cloud.getConnectionById(id),
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
