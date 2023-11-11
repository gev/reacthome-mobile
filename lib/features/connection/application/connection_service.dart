import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_command.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_query.dart';
import 'package:reacthome/features/connection/domain/connection_entity.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/extensions.dart';
import 'package:reacthome/util/repository.dart';

class ConnectionService<S> extends EventEmitter<ConnectionEvent>
    implements ConnectionCommand<S>, ConnectionQuery {
  final Repository<String, ConnectionEntity<S>> repository;

  ConnectionService({
    required super.eventSink,
    required this.repository,
  });

  @override
  Iterable<String> getAllConnections() => repository.getAll();

  @override
  Connection getConnectionById(String id) => _getById(id);

  @override
  void connect({
    required String id,
  }) =>
      _getById(id).connect()?.let(emit);

  @override
  void completeLocalConnect({
    required String id,
    required S socket,
  }) =>
      _getById(id).completeLocalConnect(socket).forEach(emit);

  @override
  void completeRemoteConnect({
    required String id,
    required S socket,
  }) =>
      _getById(id).completeRemoteConnect(socket).let(emit);

  @override
  void disconnect({
    required String id,
  }) =>
      _getById(id).disconnect()?.let(emit);

  @override
  void completeDisconnect({
    required String id,
  }) =>
      _getById(id).completeDisconnect()?.let(emit);

  ConnectionEntity _getById(String id) {
    var connection = repository.get(id);
    if (connection == null) {
      connection = ConnectionEntity(id);
      repository.add(connection);
    }
    return connection;
  }
}
