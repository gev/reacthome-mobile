import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reacthome/services/discovery/discovery_action.dart';
import 'package:reacthome/services/discovery/discovery_service.dart';

class DiscoverySocketController {
  final DiscoveryService discovery;

  DiscoverySocketController(this.discovery);

  void handle(Uint8List data) {
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
