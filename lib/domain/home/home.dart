import 'dart:io';

import 'package:reacthome/domain/meta.dart';
import 'package:reacthome/entity_framework/core/entity.dart';

abstract interface class Home implements Entity<String> {
  Meta get meta;
  InternetAddress? get address;
  String? get project;
}
