import 'dart:io';

import 'package:reacthome/features/home/home.dart';
import 'package:reacthome/features/home/home_event.dart';
import 'package:reacthome/features/meta.dart';
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

  factory HomeEntity.fromJson(Map<String, dynamic> json) {
    return HomeEntity(
      json['id'] as String,
      Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['address'] != null
          ? InternetAddress(json['address'] as String)
          : null,
      json['project'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'meta': _meta.toJson(),
      'address': _address?.host,
      'project': _project,
    };
  }

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
    updateAddress(address)?.let(events.add);
    updateProject(project)?.let(events.add);
    return events;
  }
}
