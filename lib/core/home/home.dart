import 'dart:io';

import 'package:reacthome/common/entity.dart';
import 'package:reacthome/core/meta/meta.dart';

abstract interface class Home implements Entity<String> {
  Meta get meta;
  InternetAddress? get address;
  String? get project;
}
