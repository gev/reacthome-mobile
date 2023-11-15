import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection.dart';

class DaemonConnectionEntity implements DaemonConnection {
  final String _id;
  final Connection _local;
  final Connection _cloud;
  Connection? _active;

  DaemonConnectionEntity(
    this._id,
    this._local,
    this._cloud,
  );

  @override
  String get id => _id;

  @override
  Connection get local => _local;

  @override
  Connection get cloud => _cloud;

  @override
  Connection? get active => _active;

  ConnectionEvent? selectActive() {
    if (_local.state == ConnectionState.connected) {
      _active = _local;
      return ActiveConnectChangedEvent(_id, _local.type);
    }
    if (_cloud.state == ConnectionState.connected) {
      _active = _cloud;
      return ActiveConnectChangedEvent(_id, _cloud.type);
    }
    _active = null;
    return null;
  }
}
