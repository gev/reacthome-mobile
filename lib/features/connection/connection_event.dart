import 'dart:io';

import 'package:reacthome/features/connection/connection_type.dart';

sealed class ConnectionEvent {
  final String id;
  final ConnectionType type;
  const ConnectionEvent(this.id, this.type);
}

class LocalConnectRequestedEvent extends ConnectionEvent {
  final InternetAddress address;
  const LocalConnectRequestedEvent(super.id, super.type, this.address);
}

class CloudConnectRequestedEvent extends ConnectionEvent {
  const CloudConnectRequestedEvent(super.id, super.type);
}

class ConnectCompletedEvent extends ConnectionEvent {
  const ConnectCompletedEvent(super.id, super.type);
}

class ConnectRejectedEvent<S> extends ConnectionEvent {
  final S socket;
  const ConnectRejectedEvent(super.id, super.type, this.socket);
}

class DisconnectRequestedEvent<S> extends ConnectionEvent {
  final S socket;
  const DisconnectRequestedEvent(super.id, super.type, this.socket);
}

class DisconnectCompletedEvent extends ConnectionEvent {
  const DisconnectCompletedEvent(super.id, super.type);
}

class ConnectSelectedEvent extends ConnectionEvent {
  const ConnectSelectedEvent(super.id, super.type);
}

class ConnectFailedEvent extends ConnectionEvent {
  const ConnectFailedEvent(super.id, super.type);
}
