import 'dart:async';
import 'dart:io';

import 'package:reacthome/entity_framework/core/handler.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';

class MulticastSourceFactory {
  final InternetAddress group;
  final int port;
  final Handler<Datagram> controller;

  const MulticastSourceFactory({
    required this.group,
    required this.port,
    required this.controller,
  });

  Future<MulticastSource> create() =>
      MulticastSource.create(group, port, controller);
}
