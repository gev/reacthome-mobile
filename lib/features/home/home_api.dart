import 'dart:io';

import 'package:reacthome/features/home/home.dart';
import 'package:reacthome/features/meta.dart';

abstract interface class HomeApi {
  int get count;

  Iterable<String> getAllHomesId();

  Iterable<Home> getAllHomes();

  Home? getHomeById(String id);
  void addHome({
    required String id,
    required Meta meta,
    InternetAddress? address,
    String? project,
  });

  void updateHome({
    required String id,
    required Meta meta,
    InternetAddress? address,
    String? project,
  });

  void removeHome({
    required String id,
  });

  void confirmHome({
    required String id,
  });
}
