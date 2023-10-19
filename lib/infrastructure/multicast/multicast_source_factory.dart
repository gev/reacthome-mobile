import 'dart:async';
import 'dart:typed_data';

import 'package:reacthome/infrastructure/multicast/multicast_config.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/util/actor.dart';

class MulticastSourceFactory {
  final MulticastConfig config;
  final Actor<Uint8List> controller;

  MulticastSourceFactory({
    required this.config,
    required this.controller,
  });

  Future<MulticastSource> create() =>
      MulticastSource.create(config, controller);
}
