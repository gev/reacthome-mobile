import 'dart:io';

import 'package:reacthome/entity_framework/entity.dart';
import 'package:reacthome/features/meta.dart';

abstract interface class Home implements Entity<String> {
  Meta get meta;
  InternetAddress? get address;
  String? get project;
}
