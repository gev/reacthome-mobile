import 'dart:io';

import 'package:reacthome/features/discovery/interface/discovery_action.dart';
import 'package:reacthome/features/handler.dart';
import 'package:reacthome/features/home/home_api.dart';
import 'package:reacthome/features/meta.dart';

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
        id: action.id,
        meta: Meta(
          title: action.payload.title,
          code: action.payload.code,
        ),
        project: action.payload.project,
        address: datagram.address,
      );
      discovered.confirmHome(id: action.id);
    }
  }
}
