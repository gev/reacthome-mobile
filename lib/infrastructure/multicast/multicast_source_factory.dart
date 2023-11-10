import 'dart:async';
import 'dart:io';

import 'package:reacthome/infrastructure/multicast/multicast_config.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/util/handler.dart';

class MulticastSourceFactory {
  final MulticastConfig config;
  final Handler<Datagram> controller;

  MulticastSourceFactory({
    required this.config,
    required this.controller,
  });

  Future<MulticastSource> create() => MulticastSource.create(
        config: config,
        controller: controller,
      );
}
