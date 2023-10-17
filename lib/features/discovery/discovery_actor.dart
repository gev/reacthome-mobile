import 'package:flutter/foundation.dart';
import 'package:reacthome/features/discovery/discovery_action.dart';
import 'package:reacthome/features/discovery/discovery_model.dart';
import 'package:reacthome/util/handler.dart';

class DiscoveryActor implements Handler<Uint8List> {
  final DiscoveryModel discovery;

  DiscoveryActor(this.discovery);

  @override
  void onData(Uint8List data) {
    final action = DiscoveryAction.fromData(data);
    if (action != null) discovery.increment();
  }
}
