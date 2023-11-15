import 'package:reacthome/core/daemon/daemon.dart';

abstract interface class DaemonConnectionCommand {
  void connect(Daemon daemon);
  void connectLocal(Daemon daemon);
  void connectCloud(Daemon daemon);

  void disconnect(Daemon daemon);
  void disconnectLocal(Daemon daemon);
  void disconnectCloud(Daemon daemon);

  void selectActive(String id);
}
