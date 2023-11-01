import 'package:reacthome/features/daemon/domain/daemon_entity.dart';

abstract interface class DaemonCollection {
  Iterable<String> getAllDaemons();
  bool hasDaemon(String id);
  DaemonEntity? getDaemon(String id);
  void addDaemon(DaemonEntity daemon);
  void removeDaemon(String id);
}
