import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_command.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_query.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/connection/connection_type.dart';
import 'package:reacthome/features/connection/domain/connection_entity.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/extensions.dart';
import 'package:reacthome/util/repository.dart';

class ConnectionService extends EventEmitter<ConnectionEvent>
    implements ConnectionCommand, ConnectionQuery {
  final Repository<String, ConnectionEntity> repository;

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
  void completeConnect<S>({
    required String id,
    required ConnectionType type,
    required S socket,
  }) =>
      _getById(id).completeConnect(type, socket).let(emit);

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
      connection = ConnectionEntity(id, ConnectionState.disconnected);
      repository.add(connection);
    }
    return connection;
  }
}
