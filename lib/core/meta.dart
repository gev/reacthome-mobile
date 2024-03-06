class Meta {
  final String? title;
  final String? code;

  Meta({this.title, this.code});

  factory Meta.fromJSON(Map<String, dynamic> json) => Meta(
        title: json['title'],
        code: json['code'],
      );
}
