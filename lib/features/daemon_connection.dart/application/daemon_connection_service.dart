import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_command.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_query.dart';
import 'package:reacthome/core/daemon/daemon.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_command.dart';
import 'package:reacthome/features/daemon_connection.dart/domain/daemon_connection_entity.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/extensions.dart';
import 'package:reacthome/util/repository.dart';

class DaemonConnectionService<S> extends EventEmitter<ConnectionEvent>
    implements DaemonConnectionCommand, ConnectionQuery<DaemonConnection> {
  final ({
    ConnectionQuery<Connection> query,
    LocalConnectionCommand<S> actor,
  }) local;

  final ({
    ConnectionQuery<Connection> query,
    CloudConnectionCommand<S> actor,
  }) cloud;

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
  DaemonConnection getConnectionById(String id) {
    var connection = repository.get(id);
    if (connection == null) {
      connection = DaemonConnectionEntity(id);
      repository.add(connection);
    }
    return connection;
  }

  @override
  void connect(Daemon daemon) {
    connectLocal(daemon);
    connectCloud(daemon);
  }

  @override
  void connectLocal(Daemon daemon) {
    final address = daemon.address;
    if (address != null) {
      local.actor.connect(daemon.id, address);
    }
  }

  @override
  void connectCloud(Daemon daemon) {
    cloud.actor.connect(daemon.id);
  }

  @override
  void disconnectLocal(String id) {
    local.actor.disconnect(id);
  }

  @override
  void disconnectCloud(String id) {
    cloud.actor.disconnect(id);
  }

  @override
  void disconnect(String id) {
    disconnectLocal(id);
    disconnectCloud(id);
  }

  @override
  void select(String id) {
    final connection = repository.get(id);
    connection
        ?.select(
          local.query.getConnectionById(id),
          cloud.query.getConnectionById(id),
        )
        ?.let(emit);
  }
}
