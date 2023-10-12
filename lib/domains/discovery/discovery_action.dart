import 'package:reacthome/domains/core/action.dart';

const String discovery = 'discovery';

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

class Payload {
  final String? title;
  final String? code;
  final String? project;

  const Payload({this.title, this.code, this.project});

  factory Payload.fromJSON(Map<String, dynamic> json) => Payload(
        title: json['title'],
        code: json['code'],
        project: json['project'],
      );
}
