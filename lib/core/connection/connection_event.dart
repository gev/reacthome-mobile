sealed class ConnectionEvent {
  final String id;
  const ConnectionEvent(this.id);
}

class ConnectionEventConnectRequested extends ConnectionEvent {
  ConnectionEventConnectRequested(super.id);
}

class ConnectionEventConnectCompleted<S> extends ConnectionEvent {
  final S socket;
  ConnectionEventConnectCompleted(super.id, this.socket);
}

class ConnectionEventRejected<S> extends ConnectionEvent {
  final S socket;
  ConnectionEventRejected(super.id, this.socket);
}

class ConnectionEventDisconnectedRequested extends ConnectionEvent {
  ConnectionEventDisconnectedRequested(super.id);
}

class ConnectionEventDisconnectCompleted extends ConnectionEvent {
  ConnectionEventDisconnectCompleted(super.id);
}
