class Meta {
  final String? title;
  final String? code;

  const Meta({this.title, this.code});

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
