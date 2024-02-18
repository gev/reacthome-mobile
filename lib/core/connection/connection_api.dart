import 'dart:io';

abstract interface class ConnectionApi<C, S> {
  Iterable<String> getAllConnections();
  C getConnectionById(String id);

  void completeConnect(String id, S socket);
  void disconnect(String id);
  void completeDisconnect(String id);
  void fail(String id);
}

abstract interface class LocalConnectionApi<C, S>
    implements ConnectionApi<C, S> {
  void connect(String id, InternetAddress address);
}

abstract interface class CloudConnectionApi<C, S>
    implements ConnectionApi<C, S> {
  void connect(String id);
}
