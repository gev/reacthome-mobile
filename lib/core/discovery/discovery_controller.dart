import 'dart:io';

import 'package:reacthome/core/discovery/discovery_action.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/entity_framework/handler.dart';

class DiscoveryController implements Handler<Datagram> {
  final HomeApi discovered;

  const DiscoveryController({
    required this.discovered,
  });
  @override
  void handle(Datagram datagram) {
    final action = DiscoveryAction.fromData(datagram.data);
    if (action != null) {
      discovered.addHome(
        action.id,
        meta: Meta(
          title: action.payload.title,
          code: action.payload.code,
        ),
        project: action.payload.project,
        address: datagram.address,
      );
      discovered.confirmHome(action.id);
    }
  }
}
