import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_state.dart';

class ConnectionEntity<S> implements Connection {
  final String _id;
  ConnectionState _state = ConnectionState.disconnected;
  late S _socket;

  ConnectionEntity(this._id);

  @override
  String get id => _id;

  @override
  ConnectionState get state => _state;

  @override
  S get socket => _socket;

  ConnectionEvent? connect() {
    if (_state == ConnectionState.disconnected) {
      _state = ConnectionState.connectPending;
      return ConnectionEventRemoteConnectRequested(id);
    }
    return null;
  }

  Iterable<ConnectionEvent> completeLocalConnect(S socket) {
    if (_state == ConnectionState.connectPending) {
      _state = ConnectionState.connectedLocal;
      _socket = socket;
      return [ConnectionEventConnectCompleted(id)];
    }
    if (_state == ConnectionState.connectedRemote) {
      final old = _socket;
      _state = ConnectionState.connectedLocal;
      _socket = socket;
      return [
        ConnectionEventRejected(id, old),
        ConnectionEventConnectCompleted(id),
      ];
    }
    return [ConnectionEventRejected(id, socket)];
  }

  ConnectionEvent completeRemoteConnect(S socket) {
    if (_state == ConnectionState.connectPending) {
      _state = ConnectionState.connectedRemote;
      _socket = socket;
      return ConnectionEventConnectCompleted(id);
    }
    return ConnectionEventRejected(id, socket);
  }

  ConnectionEvent? disconnect() {
    if (_state == ConnectionState.connectedLocal ||
        _state == ConnectionState.connectedRemote) {
      _state = ConnectionState.disconnectPending;
      return ConnectionEventDisconnectedRequested(id, _socket);
    }
    return null;
  }

  ConnectionEvent? completeDisconnect() {
    if (_state == ConnectionState.disconnectPending) {
      _state = ConnectionState.disconnected;
      return ConnectionEventDisconnectCompleted(id);
    }
    return null;
  }
}
