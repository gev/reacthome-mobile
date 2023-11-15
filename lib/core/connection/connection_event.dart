import 'dart:io';

import 'package:reacthome/core/connection/connection_type.dart';

sealed class ConnectionEvent {
  final String id;
  final ConnectionType type;
  const ConnectionEvent(this.id, this.type);
}

class LocalConnectRequestedEvent extends ConnectionEvent {
  final InternetAddress address;
  LocalConnectRequestedEvent(super.id, super.type, this.address);
}

class CloudConnectRequestedEvent extends ConnectionEvent {
  CloudConnectRequestedEvent(super.id, super.type);
}

class ConnectCompletedEvent extends ConnectionEvent {
  ConnectCompletedEvent(super.id, super.type);
}

class ConnectRejectedEvent<S> extends ConnectionEvent {
  final S socket;
  ConnectRejectedEvent(super.id, super.type, this.socket);
}

class DisconnectRequestedEvent<S> extends ConnectionEvent {
  final S socket;
  DisconnectRequestedEvent(super.id, super.type, this.socket);
}

class DisconnectCompletedEvent extends ConnectionEvent {
  DisconnectCompletedEvent(super.id, super.type);
}

class ConnectSelectedEvent extends ConnectionEvent {
  ConnectSelectedEvent(super.id, super.type);
}
