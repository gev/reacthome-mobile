import 'dart:io';

import 'package:reacthome/core/meta.dart';
import 'package:reacthome/util/entity.dart';

abstract interface class Daemon implements Entity<String> {
  Meta get meta;
  InternetAddress get address;
  String? get project;
}
