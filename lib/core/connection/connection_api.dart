import 'dart:io';

import 'package:reacthome/core/connection/connection.dart';

abstract interface class ConnectionApi<S> {
  Connection<S> getConnectionById(String id);

  void completeConnect(String id, S socket);
  void disconnect(String id);
  void completeDisconnect(String id);
  void fail(String id);
}

abstract interface class LocalConnectionApi<S> implements ConnectionApi<S> {
  void connect(String id, InternetAddress address);
}

abstract interface class CloudConnectionApi<S> implements ConnectionApi<S> {
  void connect(String id);
}
