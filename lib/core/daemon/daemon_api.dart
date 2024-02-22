import 'dart:io';

import 'package:reacthome/core/daemon/daemon.dart';
import 'package:reacthome/core/meta.dart';

abstract interface class DaemonApi {
  Iterable<String> getAllDaemons();
  Daemon? getDaemonById(String id);
  void addDaemon({
    required String id,
    required Meta meta,
    InternetAddress? address,
    String? project,
  });
  void removeDaemon({
    required String id,
  });
}
