import 'dart:async';
import 'dart:io';

import 'package:reacthome/core/handler.dart';
import 'package:reacthome/infrastructure/multicast/multicast_config.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';

class MulticastSourceFactory {
  final MulticastConfig config;
  final Handler<Datagram> controller;

  const MulticastSourceFactory({
    required this.config,
    required this.controller,
  });

  Future<MulticastSource> create() => MulticastSource.create(
        config: config,
        controller: controller,
      );
}
