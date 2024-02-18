import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/daemon/daemon.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_api.dart';
import 'package:reacthome/features/daemon_connection/domain/daemon_connection_entity.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/extensions.dart';
import 'package:reacthome/util/repository.dart';

class DaemonConnectionService<S> extends GenericEventEmitter<ConnectionEvent>
    implements DaemonConnectionApi {
  final LocalConnectionApi<Connection, S> local;
  final CloudConnectionApi<Connection, S> cloud;
  final Repository<String, DaemonConnectionEntity> repository;

  DaemonConnectionService({
    required super.eventSink,
    required this.local,
    required this.cloud,
    required this.repository,
  });

  @override
  Iterable<String> getAllConnections() => repository.getAll();

  @override
  DaemonConnection getConnectionById(String id) => _getConnectionById(id);

  @override
  void connectAll(Iterable<Daemon> daemons) => daemons.forEach(connect);

  @override
  void connect(Daemon daemon) {
    connectLocal(daemon);
    connectCloud(daemon);
  }

  @override
  void connectLocal(Daemon daemon) {
    final address = daemon.address;
    if (address != null) {
      local.connect(daemon.id, address);
    }
  }

  @override
  void connectCloud(Daemon daemon) {
    cloud.connect(daemon.id);
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

  DaemonConnectionEntity _getConnectionById(String id) {
    var connection = repository.get(id);
    if (connection == null) {
      connection = DaemonConnectionEntity(id);
      repository.add(connection);
    }
    return connection;
  }
}
