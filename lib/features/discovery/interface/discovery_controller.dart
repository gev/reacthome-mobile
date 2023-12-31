import 'dart:io';

import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/discovery/interface/discovery_action.dart';
import 'package:reacthome/util/handler.dart';

class DiscoveryController implements Handler<Datagram> {
  final DaemonCommand actor;

  DiscoveryController({required this.actor});
  @override
  void handle(Datagram datagram) {
    final action = DiscoveryAction.fromData(datagram.data);
    if (action != null) {
      actor.addDaemon(
        id: action.id,
        meta: Meta(
          title: action.payload.title,
          code: action.payload.code,
          timestamp: action.payload.timestamp,
        ),
        project: action.payload.project,
        address: datagram.address,
      );
    }
  }
}
