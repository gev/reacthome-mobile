import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reacthome/features/discovery/discovery_action.dart';
import 'package:reacthome/features/discovery/discovery_model.dart';
import 'package:reacthome/util/handler.dart';

class DiscoveryHandler implements Handler<Uint8List> {
  final DiscoveryModel discovery;

  DiscoveryHandler(this.discovery);

  @override
  void onData(Uint8List data) {
    final action = _parse(data);
    if (action != null) discovery.increment();
  }

  DiscoveryAction? _parse(Uint8List data) {
    try {
      final message = utf8.decode(data);
      final json = jsonDecode(message);
      final type = json['type'];
      if (type == DiscoveryAction.type) {
        return DiscoveryAction.fromJSON(json);
      }
    } catch (_) {
      // TODO: Log an error
    }
    return null;
  }
}
