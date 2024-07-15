import 'dart:io';

import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_entity.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/entity_framework/emitter.dart';
import 'package:reacthome/entity_framework/repository.dart';

class HomeService implements HomeApi {
  final Emitter<HomeEvent> eventSink;
  final Repository<String, HomeEntity> repository;

  const HomeService({
    required this.eventSink,
    required this.repository,
  });

  @override
  int get count => repository.length;

  @override
  Iterable<String> getAllHomesId() => repository.getAllId();

  @override
  Iterable<Home> getAllHomes() => repository.getAll();

  @override
  Home? getHomeById(String id) => repository.get(id);

  @override
  void addHome(
    String id, {
    required Meta meta,
    InternetAddress? address,
    String? project,
  }) {
    final home = repository.get(id);
    if (home == null) {
      final home = HomeEntity(id, meta, address, project);
      repository.set(home);
      eventSink.emit(HomeAddedEvent(home));
    } else {
      home.update(meta, address, project).forEach(eventSink.emit);
    }
  }

  @override
  void updateHome(
    String id, {
    required Meta meta,
    InternetAddress? address,
    String? project,
  }) {
    final home = repository.get(id);
    if (home != null) {
      home.update(meta, address, project).forEach(eventSink.emit);
    }
  }

  @override
  void removeHome(String id) {
    final home = repository.remove(id);
    if (home != null) {
      eventSink.emit(HomeRemovedEvent(home));
    }
  }

  @override
  void confirmHome(String id) {
    final home = repository.get(id);
    if (home != null) {
      eventSink.emit(HomeRenewEvent(home));
    }
  }
}
