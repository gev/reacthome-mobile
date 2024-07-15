import 'dart:io';

import 'package:reacthome/core/entity.dart';
import 'package:reacthome/core/meta.dart';

abstract interface class Home implements Entity<String> {
  Meta get meta;
  InternetAddress? get address;
  String? get project;
}
