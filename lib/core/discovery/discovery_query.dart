import 'package:reacthome/core/discovery/discovery_daemon.dart';

abstract interface class DiscoveryQuery {
  Iterable<String> getAllDaemons();
  DiscoveryDaemon? getDaemonById(String id);
}
