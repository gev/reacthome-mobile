import 'dart:convert';
import 'dart:typed_data';

import 'package:reacthome/controllers/discovery/discovery_action.dart';

class DiscoveryActionDto {
  DiscoveryActionDto._();

  static DiscoveryAction fromJson(Map<String, dynamic> json) => DiscoveryAction(
        id: json['id'],
        payload: PayloadDto.fromJSON(json['payload']),
      );

  static DiscoveryAction? fromData(Uint8List data) {
    final message = utf8.decode(data);
    final json = jsonDecode(message);
    final type = json['type'];
    return type == DiscoveryAction.type ? fromJson(json) : null;
  }
}

class PayloadDto {
  static Payload fromJSON(Map<String, dynamic> json) => Payload(
        title: json['title'],
        code: json['code'],
        project: json['project'],
        timestamp: json['timestamp'],
      );
}
