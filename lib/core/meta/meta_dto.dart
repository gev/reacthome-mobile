import 'package:reacthome/core/meta/meta.dart';

class MetaDto {
  static Meta fromJson(Map<String, dynamic> json) => Meta(
        title: json['title'],
        code: json['code'],
      );

  static Map<String, dynamic> toJson(Meta meta) => {
        'title': meta.title,
        'code': meta.code,
      };
}
