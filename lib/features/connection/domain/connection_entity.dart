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
    switch (_state) {
      case ConnectionState.disconnected:
        _state = ConnectionState.connectPending;
        return ConnectionEventRemoteConnectRequested(id);
      default:
        return null;
    }
  }

  Iterable<ConnectionEvent> completeLocalConnect(S socket) {
    switch (_state) {
      case ConnectionState.connectPending:
        _state = ConnectionState.connectedLocal;
        _socket = socket;
        return [ConnectionEventConnectCompleted(id)];
      case ConnectionState.connectedRemote:
        final old = _socket;
        _state = ConnectionState.connectedLocal;
        _socket = socket;
        return [
          ConnectionEventRejected(id, old),
          ConnectionEventConnectCompleted(id),
        ];
      default:
        return [ConnectionEventRejected(id, socket)];
    }
  }

  ConnectionEvent completeRemoteConnect(S socket) {
    switch (_state) {
      case ConnectionState.connectPending:
        _state = ConnectionState.connectedRemote;
        _socket = socket;
        return ConnectionEventConnectCompleted(id);
      default:
        return ConnectionEventRejected(id, socket);
    }
  }

  ConnectionEvent? disconnect() {
    switch (_state) {
      case ConnectionState.connectedLocal:
      case ConnectionState.connectedRemote:
        _state = ConnectionState.disconnectPending;
        return ConnectionEventDisconnectRequested(id, _socket);
      default:
        return null;
    }
  }

  ConnectionEvent? completeDisconnect() {
    switch (_state) {
      case ConnectionState.disconnectPending:
        _state = ConnectionState.disconnected;
        return ConnectionEventDisconnectCompleted(id);
      default:
        return null;
    }
  }
}
