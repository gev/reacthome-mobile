import 'dart:io';

import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/meta/meta.dart';

abstract interface class HomeApi {
  int get count;

  Iterable<String> getAllHomesId();

  Iterable<Home> getAllHomes();

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
