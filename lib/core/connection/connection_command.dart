import 'dart:io';

abstract interface class ConnectionCommand<S> {
  void completeConnect(String id, S socket);
  void disconnect(String id);
  void completeDisconnect(String id);
}

abstract interface class LocalConnectionCommand<S>
    implements ConnectionCommand<S> {
  void connect(String id, InternetAddress address);
}

abstract interface class CloudConnectionCommand<S>
    implements ConnectionCommand<S> {
  void connect(String id);
}
