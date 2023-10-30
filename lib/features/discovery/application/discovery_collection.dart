import 'package:reacthome/features/discovery/domain/discovery_daemon_entity.dart';

abstract interface class DiscoveryCollection {
  Iterable<String> getAllDaemons();
  bool hasDaemon(String id);
  DiscoveryDaemonEntity? getDaemon(String id);
  void addDaemon(DiscoveryDaemonEntity daemon);
  void removeDaemon(String id);
}
