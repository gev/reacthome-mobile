import 'dart:io';

import 'package:reacthome/core/meta.dart';

abstract interface class DiscoveryCommand {
  void addDaemon({
    required String id,
    required Meta meta,
    required InternetAddress address,
    String? project,
  });
  void removeDaemon({
    required String id,
  });
}
