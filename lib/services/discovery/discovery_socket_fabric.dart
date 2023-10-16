import 'dart:async';

import 'package:reacthome/services/discovery/discovery_config.dart';
import 'package:reacthome/services/discovery/discovery_socket.dart';
import 'package:reacthome/services/discovery/discovery_socket_controller.dart';
import 'package:reacthome/utils/fabric.dart';

class DiscoverySocketFabric implements AsyncFabric<DiscoverySocket> {
  final DiscoveryConfig config;
  final DiscoverySocketController controller;

  DiscoverySocketFabric(this.config, this.controller);

  @override
  Future<DiscoverySocket> create() =>
      DiscoverySocket.create(config, controller);
}
