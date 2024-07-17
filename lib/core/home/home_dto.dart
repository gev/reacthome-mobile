import 'dart:io';

import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home/home_entity.dart';
import 'package:reacthome/core/meta_dto.dart';

class HomeDto {
  HomeDto._();

  static HomeEntity fromJson(Map<String, dynamic> json) => HomeEntity(
        json['id'],
        MetaDto.fromJson(json['meta']),
        json['address']?.let(InternetAddress.new),
        json['project'],
      );

  static Map<String, dynamic> toJson(Home home) => {
        'id': home.id,
        'meta': MetaDto.toJson(home.meta),
        'address': home.address?.host,
        'project': home.project,
      };
}
