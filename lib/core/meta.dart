class Meta {
  final String? title;
  final String? code;

  Meta({this.title, this.code});

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

  factory Meta.fromJSON(Map<String, dynamic> json) => Meta(
        title: json['title'],
        code: json['code'],
      );
}
