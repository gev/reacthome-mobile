import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection.dart';

class DaemonConnectionEntity implements DaemonConnection {
  final String _id;
  Connection? _connection;

  DaemonConnectionEntity(this._id);

  @override
  String get id => _id;

  @override
  Connection? get connection => _connection;

  ConnectionEvent? selectActive(Connection local, Connection cloud) {
    if (local.state == ConnectionState.connected) {
      _connection = local;
      return ActiveConnectChangedEvent(_id, local.type);
    }
    if (cloud.state == ConnectionState.connected) {
      _connection = cloud;
      return ActiveConnectChangedEvent(_id, cloud.type);
    }
    _connection = null;
    return null;
  }
}
