import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_command.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_query.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/util/event_listener.dart';
import 'package:reacthome/util/repository.dart';

class ActiveConnectionService<S> extends EventListener<ConnectionEvent>
    implements ConnectionQuery<Connection?> {
  final ConnectionQuery localQuery;
  final ConnectionCommand<S> localActor;
  final ConnectionQuery cloudQuery;
  final ConnectionCommand<S> cloudActor;
  final Repository<String, Connection> repository;

  ActiveConnectionService({
    required super.eventSource,
    required this.localQuery,
    required this.localActor,
    required this.cloudQuery,
    required this.cloudActor,
    required this.repository,
  });

  @override
  Iterable<String> getAllConnections() => repository.getAll();

  @override
  Connection? getConnectionById(String id) => repository.get(id);

  @override
  void handle(ConnectionEvent event) {
    switch (event) {
      case ConnectionEventConnectCompleted e:
        _activateConnection(e.id);
      case ConnectionEventDisconnectCompleted e:
        _activateConnection(e.id);
      default:
    }
  }

  void _activateConnection(String id) {
    final localConnection = localQuery.getConnectionById(id);
    if (localConnection.state == ConnectionState.connected) {
      repository.add(localConnection);
      cloudActor.disconnect(id);
      return;
    }
    final cloudConnection = cloudQuery.getConnectionById(id);
    if (cloudConnection.state == ConnectionState.connected) {
      repository.add(cloudConnection);
      localActor.disconnect(id);
      return;
    }
    repository.remove(id);
  }
}
