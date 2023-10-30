import 'dart:io';

import 'package:reacthome/core/discovery_command.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/discovery/interface/discovery_action.dart';
import 'package:reacthome/util/actor.dart';

class DiscoveryController implements Actor<Datagram> {
  final Actor<DiscoveryCommand> actor;

  DiscoveryController({required this.actor});
  @override
  void execute(Datagram datagram) {
    final action = DiscoveryAction.fromData(datagram.data);
    if (action != null) {
      actor.execute(
        DiscoveryCommandAddDaemon(
          id: action.id,
          meta: Meta(
            title: action.payload.title,
            code: action.payload.code,
            timestamp: action.payload.timestamp,
          ),
          project: action.payload.project,
          address: datagram.address,
        ),
      );
    }
  }
}
