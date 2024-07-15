import 'dart:async';
import 'dart:io';

import 'package:reacthome/features/handler.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/make/config/multicast_config.dart';

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
