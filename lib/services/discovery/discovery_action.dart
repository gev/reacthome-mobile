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
