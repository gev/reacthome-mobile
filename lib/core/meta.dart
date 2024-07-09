class Meta {
  final String? title;
  final String? code;

  Meta({this.title, this.code});

  factory Meta.fromJSON(Map<String, dynamic> json) => Meta(
        title: json['title'],
        code: json['code'],
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Meta &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          code == other.code;

  @override
  int get hashCode => Object.hash(title, code);
}
