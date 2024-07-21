import 'dart:io';

import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta/meta.dart';
import 'package:reacthome/util/extensions.dart';

class HomeEntity implements Home {
  final String _id;
  Meta _meta;
  InternetAddress? _address;
  String? _project;

  HomeEntity(
    this._id,
    this._meta,
    this._address,
    this._project,
  );

  @override
  String get id => _id;

  @override
  Meta get meta => _meta;
  HomeEvent? updateMeta(Meta meta) {
    if (_meta != meta) {
      _meta = meta;
      return HomeMetaChangedEvent(this);
    }
    return null;
  }

  @override
  InternetAddress? get address => _address;
  HomeEvent? updateAddress(InternetAddress? address) {
    if (_address != address) {
      _address = address;
      return HomeAddressChangedEvent(this);
    }
    return null;
  }

  @override
  String? get project => _project;
  HomeEvent? updateProject(String? project) {
    if (_project != project) {
      _project = project;
      return HomeProjectChangedEvent(this);
    }
    return null;
  }

  Iterable<HomeEvent> update(
      Meta meta, InternetAddress? address, String? project) {
    final events = <HomeEvent>[];
    updateMeta(meta)?.let(events.add);
    address?.let(updateAddress)?.let(events.add);
    updateProject(project)?.let(events.add);
    return events;
  }
}
