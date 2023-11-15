import 'dart:io';

import 'package:reacthome/core/daemon/daemon.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/util/extensions.dart';

class DaemonEntity implements Daemon {
  final String _id;
  Meta _meta;
  InternetAddress _address;
  String? _project;

  DaemonEntity(
    this._id,
    this._meta,
    this._address,
    this._project,
  );

  @override
  String get id => _id;

  @override
  Meta get meta => _meta;
  DaemonEvent? updateMeta(Meta meta) {
    if (_meta != meta) {
      _meta = meta;
      return DaemonMetaChangedEvent(id);
    }
    return null;
  }

  @override
  InternetAddress get address => _address;
  DaemonEvent? updateAddress(InternetAddress address) {
    if (_address != address) {
      _address = address;
      return DaemonAddressChangedEvent(id);
    }
    return null;
  }

  @override
  String? get project => _project;
  DaemonEvent? updateProject(String? project) {
    if (_project != project) {
      _project = project;
      return DaemonProjectChangedEvent(id);
    }
    return null;
  }

  Iterable<DaemonEvent> update(
      Meta meta, InternetAddress address, String? project) {
    final events = <DaemonEvent>[];
    updateMeta(meta)?.let(events.add);
    updateAddress(address)?.let(events.add);
    updateProject(project)?.let(events.add);
    return events;
  }
}
