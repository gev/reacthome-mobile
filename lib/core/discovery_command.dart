import 'dart:io';

import 'package:reacthome/core/meta.dart';

sealed class DiscoveryCommand {
  final String id;
  DiscoveryCommand({required this.id});
}

class DiscoveryCommandAddDaemon extends DiscoveryCommand {
  final Meta meta;
  final InternetAddress address;
  final String? project;
  DiscoveryCommandAddDaemon({
    required super.id,
    required this.meta,
    required this.address,
    this.project,
  });
}

class DiscoveryCommandRemoveDaemon extends DiscoveryCommand {
  DiscoveryCommandRemoveDaemon({required super.id});
}
