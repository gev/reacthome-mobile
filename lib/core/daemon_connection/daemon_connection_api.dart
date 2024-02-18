import 'package:reacthome/core/daemon/daemon.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection.dart';

abstract interface class DaemonConnectionApi {
  Iterable<String> getAllConnections();
  DaemonConnection getConnectionById(String id);

  void connectAll(Iterable<Daemon> daemons);
  void connect(Daemon daemon);
  void connectLocal(Daemon daemon);
  void connectCloud(Daemon daemon);

  void disconnectAll();
  void disconnect(String id);
  void disconnectLocal(String id);
  void disconnectCloud(String id);

  void select(String id);
}
