class DiscoveryAction {
  static const type = 'discovery';
  final String id;
  final Payload payload;

  const DiscoveryAction({required this.id, required this.payload});
}

class Payload {
  final String? title;
  final String? code;
  final String? project;
  final int? timestamp;

  const Payload({this.title, this.code, this.project, this.timestamp});
}
