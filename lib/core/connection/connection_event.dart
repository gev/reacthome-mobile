import 'dart:io';

sealed class ConnectionEvent {
  final String id;
  const ConnectionEvent(this.id);
}

class ConnectionEventLocalConnectRequested extends ConnectionEvent {
  final InternetAddress address;
  ConnectionEventLocalConnectRequested(super.id, this.address);
}

class ConnectionEventRemoteConnectRequested extends ConnectionEvent {
  ConnectionEventRemoteConnectRequested(super.id);
}

class ConnectionEventConnectCompleted extends ConnectionEvent {
  ConnectionEventConnectCompleted(super.id);
}

class ConnectionEventRejected<S> extends ConnectionEvent {
  final S socket;
  ConnectionEventRejected(super.id, this.socket);
}

class ConnectionEventDisconnectedRequested<S> extends ConnectionEvent {
  final S socket;
  ConnectionEventDisconnectedRequested(super.id, this.socket);
}

class ConnectionEventDisconnectCompleted extends ConnectionEvent {
  ConnectionEventDisconnectCompleted(super.id);
}
