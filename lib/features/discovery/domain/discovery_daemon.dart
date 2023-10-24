import 'dart:io';

import 'package:reacthome/core/meta.dart';

class DiscoveryDaemon {
  final Meta meta;
  final InternetAddress address;
  final String? project;

  DiscoveryDaemon({
    required this.meta,
    required this.address,
    this.project,
  });

  @override
  bool operator ==(Object other) =>
      other is DiscoveryDaemon &&
      meta == other.meta &&
      address == other.address &&
      project == other.project;

  @override
  int get hashCode => meta.hashCode ^ project.hashCode ^ address.hashCode;
}
