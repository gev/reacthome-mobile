import 'dart:io';

import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/meta/meta.dart';

abstract interface class HomeApi {
  Iterable<String> get homes;

  Home? getHomeById(String id);

  void addHome(
    String id, {
    required Meta meta,
    InternetAddress? address,
    String? project,
  });

  void updateHome(
    String id, {
    required Meta meta,
    InternetAddress? address,
    String? project,
  });

  void removeHome(String id);

  void confirmHome(String id);
}
