import 'dart:io';

import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/features/connection/domain/connection_entity.dart';
import 'package:reacthome/util/bus/bus_emitter.dart';
import 'package:reacthome/util/extensions.dart';
import 'package:reacthome/util/repository/repository.dart';

abstract class ConnectionService<C extends ConnectionEntity<S>, S>
    extends GenericBusEmitter<ConnectionEvent> implements ConnectionApi<S> {
  final InMemoryRepository<String, C> repository;

  ConnectionService({
    required super.eventSink,
    required this.repository,
  });

  @override
  Iterable<String> getAllConnectionsId() => repository.getAllId();

  @override
  Iterable<Connection<S>> getAllConnections() => repository.getAll();

  @override
  Connection<S> getConnectionById(String id) => _getById(id);

  @override
  void completeConnect(String id, S socket) =>
      repository.get(id)?.completeConnect(socket).let(emit);

  @override
  void disconnect(String id) => repository.get(id)?.disconnect()?.let(emit);

  @override
  void completeDisconnect(String id) =>
      repository.get(id)?.completeDisconnect()?.let(emit);

  @override
  void fail(String id) => repository.get(id)?.fail()?.let(emit);

  C _create(String id);

  C _getById(String id) {
    var connection = repository.get(id);
    if (connection == null) {
      connection = _create(id);
      repository.add(connection);
    }
    return connection;
  }
}

class LocalConnectionService<S>
    extends ConnectionService<LocalConnectionEntity<S>, S>
    implements LocalConnectionApi<S> {
  LocalConnectionService({
    required super.eventSink,
    required super.repository,
  });

  @override
  void connect(String id, InternetAddress address) =>
      _getById(id).connect(address)?.let(emit);

  @override
  LocalConnectionEntity<S> _create(String id) => LocalConnectionEntity(id);
}

class CloudConnectionService<S>
    extends ConnectionService<CloudConnectionEntity<S>, S>
    implements CloudConnectionApi<S> {
  CloudConnectionService({
    required super.eventSink,
    required super.repository,
  });

  @override
  void connect(String id) => _getById(id).connect()?.let(emit);

  @override
  CloudConnectionEntity<S> _create(String id) => CloudConnectionEntity(id);
}
