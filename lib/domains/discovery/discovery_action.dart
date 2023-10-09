import 'package:reacthome/domains/core/action.dart';

const String discovery = 'discovery';

class Payload {
  final String? title;
  final String? code;
  final String? project;
  final List<String>? device;

  const Payload({this.title, this.code, this.project, this.device});

  factory Payload.fromJSON(Map<String, dynamic> json) => Payload(
        title: json['title'],
        code: json['code'],
        project: json['project'],
        device: json['device'],
      );
}

class DiscoveryAction extends Action {
  final String id;
  final Payload payload;

  const DiscoveryAction({required this.id, required this.payload})
      : super(type: discovery);

  factory DiscoveryAction.fromJSON(Map<String, dynamic> json) =>
      DiscoveryAction(
        id: json['id'],
        payload: Payload.fromJSON(json['payload']),
      );
}
