import 'dart:io';

import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/meta.dart';

abstract interface class HomeApi {
  Iterable<String> getAllHomes();
  Home? getHomeById(String id);
  void addHome({
    required String id,
    required Meta meta,
    InternetAddress? address,
    String? project,
  });
  void removeHome({
    required String id,
  });
}
