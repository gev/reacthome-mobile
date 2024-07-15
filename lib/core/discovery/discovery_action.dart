import 'dart:convert';
import 'dart:typed_data';

class DiscoveryAction {
  static const type = 'discovery';
  final String id;
  final Payload payload;

  const DiscoveryAction({required this.id, required this.payload});

  factory DiscoveryAction.fromJSON(Map<String, dynamic> json) =>
      DiscoveryAction(
        id: json['id'],
        payload: Payload.fromJSON(json['payload']),
      );

  static DiscoveryAction? fromData(Uint8List data) {
    DiscoveryAction? action;
    try {
      final message = utf8.decode(data);
      final json = jsonDecode(message) as Map<String, dynamic>;
      final type = json['type'];
      if (type == DiscoveryAction.type) {
        action = DiscoveryAction.fromJSON(json);
      }
    } catch (_) {
      action = null;
    }
    return action;
  }
}

class Payload {
  final String? title;
  final String? code;
  final String? project;
  final int? timestamp;

  const Payload({this.title, this.code, this.project, this.timestamp});

  factory Payload.fromJSON(Map<String, dynamic> json) => Payload(
        title: json['title'],
        code: json['code'],
        project: json['project'],
        timestamp: json['timestamp'],
      );
}
