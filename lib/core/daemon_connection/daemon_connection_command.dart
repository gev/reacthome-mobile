import 'package:reacthome/core/daemon/daemon.dart';

abstract interface class DaemonConnectionCommand {
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
