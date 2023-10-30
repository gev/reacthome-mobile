class Meta {
  final String? title;
  final String? code;
  final int? timestamp;

  Meta({this.title, this.code, this.timestamp});

  String? get name {
    if (title != null && code != null) {
      return '$title / $code';
    }
    if (title != null) {
      return title;
    }
    if (code != null) {
      return code;
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      other is Meta &&
      title == other.title &&
      code == other.code &&
      timestamp == other.timestamp;

  bool isNewer(Meta other) {
    if (timestamp != null) {
      if (other.timestamp != null) {
        return timestamp! > other.timestamp!;
      }
      return true;
    }
    return false;
  }

  @override
  int get hashCode => title.hashCode ^ code.hashCode ^ timestamp.hashCode;

  factory Meta.fromJSON(Map<String, dynamic> json) => Meta(
        title: json['title'],
        code: json['code'],
        timestamp: json['timestamp'],
      );
}
