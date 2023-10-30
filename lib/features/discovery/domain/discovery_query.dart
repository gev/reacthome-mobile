import 'package:reacthome/features/discovery/domain/discovery_daemon.dart';

abstract interface class DiscoveryQuery {
  Iterable<String> getAllDaemons();
  DiscoveryDaemon? getDaemonById(String id);
}
