import 'dart:io';

import 'package:reacthome/core/connection/connection_type.dart';

sealed class ConnectionEvent {
  final String id;
  final ConnectionType type;
  const ConnectionEvent(this.id, this.type);
}

class ConnectionEventLocalConnectRequested extends ConnectionEvent {
  final InternetAddress address;
  ConnectionEventLocalConnectRequested(super.id, super.type, this.address);
}

class ConnectionEventCloudConnectRequested extends ConnectionEvent {
  ConnectionEventCloudConnectRequested(super.id, super.type);
}

class ConnectionEventConnectCompleted extends ConnectionEvent {
  ConnectionEventConnectCompleted(super.id, super.type);
}

class ConnectionEventRejected<S> extends ConnectionEvent {
  final S socket;
  ConnectionEventRejected(super.id, super.type, this.socket);
}

class ConnectionEventDisconnectRequested<S> extends ConnectionEvent {
  final S socket;
  ConnectionEventDisconnectRequested(super.id, super.type, this.socket);
}

class ConnectionEventDisconnectCompleted extends ConnectionEvent {
  ConnectionEventDisconnectCompleted(super.id, super.type);
}
