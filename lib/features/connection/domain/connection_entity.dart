import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/connection/connection_type.dart';

class ConnectionEntity implements Connection {
  final String _id;
  ConnectionState _state;

  ConnectionEntity(this._id, this._state);

  @override
  String get id => _id;

  @override
  ConnectionState get state => _state;

  ConnectionEvent? connect() {
    if (_state == ConnectionState.disconnected) {
      _state = ConnectionState.connectPending;
      return ConnectionEventConnectRequested(id);
    }
    return null;
  }

  ConnectionEvent completeConnect<S>(ConnectionType type, S socket) {
    if (_state == ConnectionState.connectPending) {
      switch (type) {
        case ConnectionType.local:
          _state = ConnectionState.connectedLocal;
        case ConnectionType.remote:
          _state = ConnectionState.connectedRemote;
      }
      return ConnectionEventConnectCompleted(id, socket);
    } else if (_state == ConnectionState.connectedRemote &&
        type == ConnectionType.local) {
      _state = ConnectionState.connectedLocal;
      return ConnectionEventConnectCompleted(id, socket);
    }
    return ConnectionEventRejected(id, socket);
  }

  ConnectionEvent? disconnect() {
    if (_state == ConnectionState.connectedLocal ||
        _state == ConnectionState.connectedRemote) {
      _state = ConnectionState.disconnectPending;
      return ConnectionEventDisconnectedRequested(id);
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
