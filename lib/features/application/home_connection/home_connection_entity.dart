import 'package:reacthome/features/application/connection/connection.dart';
import 'package:reacthome/features/application/connection/connection_event.dart';
import 'package:reacthome/features/application/connection/connection_state.dart';
import 'package:reacthome/features/application/home_connection/home_connection.dart';

class HomeConnectionEntity<S> implements HomeConnection<S> {
  final String _id;
  Connection<S>? _connection;

  HomeConnectionEntity(this._id);

  @override
  String get id => _id;

  @override
  Connection<S>? get connection => _connection;

  ConnectionEvent? select(Connection<S> local, Connection<S> cloud) {
    if (local.state == ConnectionState.connected) {
      _connection = local;
      return ConnectSelectedEvent(_id, local.type);
    }
    if (cloud.state == ConnectionState.connected) {
      _connection = cloud;
      return ConnectSelectedEvent(_id, cloud.type);
    }
    _connection = null;
    return null;
  }
}
