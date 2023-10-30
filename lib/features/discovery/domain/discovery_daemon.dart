import 'dart:io';

import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/util/extensions.dart';

sealed class DiscoveryDaemon {
  String get id;
  Meta get meta;
  InternetAddress get address;
  String? get project;

  static DiscoveryDaemonEntity create(
          String id, Meta meta, InternetAddress address, String? project) =>
      DiscoveryDaemonEntity._(id, meta, address, project);
}

class DiscoveryDaemonEntity implements DiscoveryDaemon {
  final String _id;
  Meta _meta;
  InternetAddress _address;
  String? _project;

  DiscoveryDaemonEntity._(
    this._id,
    this._meta,
    this._address,
    this._project,
  );

  @override
  String get id => _id;

  @override
  Meta get meta => _meta;
  DiscoveryEvent? updateMeta(Meta meta) {
    if (_meta != meta) {
      _meta = meta;
      return DiscoveryEventDaemonMetaChanged(id);
    }
    return null;
  }

  @override
  InternetAddress get address => _address;
  DiscoveryEvent? updateAddress(InternetAddress address) {
    if (_address != address) {
      _address = address;
      return DiscoveryEventDaemonAddressChanged(id);
    }
    return null;
  }

  @override
  String? get project => _project;
  DiscoveryEvent? updateProject(String? project) {
    if (_project != project) {
      _project = project;
      return DiscoveryEventDaemonProjectChanged(id);
    }
    return null;
  }

  Iterable<DiscoveryEvent> update(
      Meta meta, InternetAddress address, String? project) {
    final events = <DiscoveryEvent>[];
    updateMeta(meta)?.let(events.add);
    updateAddress(address)?.let(events.add);
    updateProject(project)?.let(events.add);
    return events;
  }
}
