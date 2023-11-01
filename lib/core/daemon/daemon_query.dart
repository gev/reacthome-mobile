import 'package:reacthome/core/daemon/daemon.dart';

abstract interface class DaemonQuery {
  Iterable<String> getAllDaemons();
  Daemon? getDaemonById(String id);
}
