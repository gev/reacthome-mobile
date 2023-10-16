import 'dart:async';
import 'dart:typed_data';

import 'package:reacthome/infrastructure/multicast/multicast_config.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/util/fabric.dart';
import 'package:reacthome/util/handler.dart';

class MulticastSourceFabric implements AsyncFabric<MulticastSource> {
  final MulticastConfig config;
  final Handler<Uint8List> handler;

  MulticastSourceFabric(this.config, this.handler);

  @override
  Future<MulticastSource> create() => MulticastSource.create(
        port: config.port,
        group: config.group,
        handler: handler,
      );
}
