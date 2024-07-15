import 'dart:io';

import 'package:reacthome/core/meta.dart';
import 'package:reacthome/entity_framework/entity.dart';

abstract interface class Home implements Entity<String> {
  Meta get meta;
  InternetAddress? get address;
  String? get project;
}
