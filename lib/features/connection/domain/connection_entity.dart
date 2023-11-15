import 'dart:io';

import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/core/connection/connection_type.dart';

abstract class ConnectionEntity<S> implements Connection {
  final String _id;
  ConnectionState _state = ConnectionState.disconnected;
  late S _socket;

  ConnectionEntity(this._id);

  @override
  String get id => _id;

  @override
  ConnectionState get state => _state;

  S get socket => _socket;

  ConnectionEvent? _connect(ConnectionEvent Function() createEvent) {
    switch (_state) {
      case ConnectionState.failed:
      case ConnectionState.disconnected:
        _state = ConnectionState.connectPending;
        return createEvent();
      default:
        return null;
    }
  }

  ConnectionEvent completeConnect(S socket) {
    switch (_state) {
      case ConnectionState.connectPending:
        _state = ConnectionState.connected;
        _socket = socket;
        return ConnectCompletedEvent(id, type);
      default:
        return ConnectRejectedEvent(id, type, socket);
    }
  }

  ConnectionEvent? disconnect() {
    switch (_state) {
      case ConnectionState.connected:
        _state = ConnectionState.disconnectPending;
        return DisconnectRequestedEvent(id, type, _socket);
      default:
        return null;
    }
  }

  ConnectionEvent? completeDisconnect() {
    switch (_state) {
      case ConnectionState.disconnectPending:
        _state = ConnectionState.disconnected;
        return DisconnectCompletedEvent(id, type);
      default:
        return null;
    }
  }

  ConnectionEvent? fail() {
    switch (_state) {
      case ConnectionState.connectPending:
        _state = ConnectionState.failed;
        return ConnectFailedEvent(id, type);
      default:
        return null;
    }
  }
}

class LocalConnectionEntity<S> extends ConnectionEntity<S> {
  LocalConnectionEntity(super.id);

  @override
  ConnectionType get type => ConnectionType.local;

  ConnectionEvent? connect(InternetAddress address) =>
      _connect(() => LocalConnectRequestedEvent(id, type, address));
}

class CloudConnectionEntity<S> extends ConnectionEntity<S> {
  CloudConnectionEntity(super.id);

  @override
  ConnectionType get type => ConnectionType.cloud;

  ConnectionEvent? connect() =>
      _connect(() => CloudConnectRequestedEvent(id, type));
}
