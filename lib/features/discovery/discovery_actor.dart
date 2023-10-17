import 'package:flutter/foundation.dart';
import 'package:reacthome/features/discovery/discovery_action.dart';
import 'package:reacthome/features/discovery/discovery_model.dart';
import 'package:reacthome/util/actor.dart';

class DiscoveryActor implements Actor<Uint8List> {
  final DiscoveryModel discovery;

  DiscoveryActor(this.discovery);

  @override
  void run(Uint8List data) {
    final action = DiscoveryAction.fromData(data);
    if (action != null) discovery.increment();
  }
}
