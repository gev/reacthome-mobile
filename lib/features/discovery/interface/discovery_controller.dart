import 'dart:io';

import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/discovery/interface/discovery_action.dart';
import 'package:reacthome/util/handler.dart';

class DiscoveryController implements Handler<Datagram> {
  final HomeApi discovered;
  final HomeApi known;

  DiscoveryController({required this.discovered, required this.known});
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
      known.updateHome(
        id: action.id,
        meta: Meta(
          title: action.payload.title,
          code: action.payload.code,
        ),
        project: action.payload.project,
        address: datagram.address,
      );
    }
  }
}
