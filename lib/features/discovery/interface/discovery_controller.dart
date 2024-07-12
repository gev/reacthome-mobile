import 'dart:io';

import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/discovery/interface/discovery_action.dart';
import 'package:reacthome/util/handler.dart';

class DiscoveryController implements Handler<Datagram> {
  final HomeApi discovered;
  final HomeApi known;
  final HomeConnectionApi connection;

  DiscoveryController({
    required this.discovered,
    required this.known,
    required this.connection,
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
      final home = known.getHomeById(action.id);
      final shouldReconnect = home != null && home.address != datagram.address;
      known.updateHome(
        id: action.id,
        meta: Meta(
          title: action.payload.title,
          code: action.payload.code,
        ),
        project: action.payload.project,
        address: datagram.address,
      );
      if (shouldReconnect) {
        connection.disconnectLocal(home.id);
        connection.connectLocal(home);
      }
    }
  }
}
