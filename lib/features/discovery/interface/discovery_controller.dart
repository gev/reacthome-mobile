import 'package:flutter/foundation.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/interface/discovery_action.dart';
import 'package:reacthome/util/actor.dart';

class DiscoveryController implements Actor<Uint8List> {
  final DiscoveryService discovery;

  DiscoveryController({required this.discovery});
  @override
  void run(Uint8List data) {
    final action = DiscoveryAction.fromData(data);
    if (action != null) {
      discovery.addDaemon(action.id);
    }
  }
}
