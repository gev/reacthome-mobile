import 'dart:io';

import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_daemon.dart';
import 'package:reacthome/features/discovery/interface/discovery_action.dart';
import 'package:reacthome/util/actor.dart';

class DiscoveryController implements Actor<Datagram> {
  final DiscoveryService discovery;

  DiscoveryController({required this.discovery});
  @override
  void run(Datagram datagram) {
    final action = DiscoveryAction.fromData(datagram.data);
    if (action != null) {
      discovery.addDaemon(
        action.id,
        DiscoveryDaemon(
            meta: Meta(
              title: action.payload.title,
              code: action.payload.code,
              timestamp: action.payload.timestamp,
            ),
            project: action.payload.project,
            address: datagram.address),
      );
    }
  }
}
