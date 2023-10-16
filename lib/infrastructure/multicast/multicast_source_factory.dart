import 'dart:async';
import 'dart:typed_data';

import 'package:reacthome/infrastructure/multicast/multicast_config.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/util/factory.dart';
import 'package:reacthome/util/handler.dart';

class MulticastSourceFactory implements AsyncFactory<MulticastSource> {
  final MulticastConfig config;
  final Handler<Uint8List> handler;

  MulticastSourceFactory(this.config, this.handler);

  @override
  Future<MulticastSource> create() => MulticastSource.create(
        port: config.port,
        group: config.group,
        handler: handler,
      );
}
