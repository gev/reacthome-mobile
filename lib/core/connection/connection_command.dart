import 'dart:io';

abstract interface class ConnectionCommand<S> {
  void completeConnect(String id, S socket);
  void disconnect(String id);
  void completeDisconnect(String id);
}

abstract interface class LocalConnectionCommand {
  void connect(String id, InternetAddress address);
}

abstract interface class CloudConnectionCommand {
  void connect(String id);
}
