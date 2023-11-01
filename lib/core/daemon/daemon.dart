import 'dart:io';

import 'package:reacthome/core/meta.dart';

abstract interface class Daemon {
  String get id;
  Meta get meta;
  InternetAddress get address;
  String? get project;
}
