import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home_connection/home_connection.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/features/home_connection/domain/home_connection_entity.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/extensions.dart';
import 'package:reacthome/util/repository.dart';

class HomeConnectionService<S> extends GenericEventEmitter<ConnectionEvent>
    implements HomeConnectionApi {
  final LocalConnectionApi<S> local;
  final CloudConnectionApi<S> cloud;
  final Repository<String, HomeConnectionEntity> repository;

  HomeConnectionService({
    required super.eventSink,
    required this.local,
    required this.cloud,
    required this.repository,
  });

  @override
  Iterable<String> getAllConnections() => repository.getAll();

  @override
  HomeConnection getConnectionById(String id) => _getConnectionById(id);

  @override
  void connectAll(Iterable<Home> homes) => homes.forEach(connect);

  @override
  void connect(Home home) {
    connectLocal(home);
    connectCloud(home);
  }

  @override
  void connectLocal(Home home) {
    final address = home.address;
    if (address != null) {
      local.connect(home.id, address);
    }
  }

  @override
  void connectCloud(Home home) {
    cloud.connect(home.id);
  }

  @override
  void disconnectAll() => getAllConnections().forEach(disconnect);

  @override
  void disconnect(String id) {
    disconnectLocal(id);
    disconnectCloud(id);
  }

  @override
  void disconnectLocal(String id) {
    local.disconnect(id);
  }

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
      ?.let(emit);

  HomeConnectionEntity _getConnectionById(String id) {
    var connection = repository.get(id);
    if (connection == null) {
      connection = HomeConnectionEntity(id);
      repository.add(connection);
    }
    return connection;
  }
}
