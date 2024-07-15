import 'dart:io';

import 'package:reacthome/domain/home/home.dart';
import 'package:reacthome/domain/home/home_api.dart';
import 'package:reacthome/domain/home/home_entity.dart';
import 'package:reacthome/domain/home/home_event.dart';
import 'package:reacthome/domain/meta.dart';
import 'package:reacthome/entity_framework/core/emitter.dart';
import 'package:reacthome/entity_framework/core/repository.dart';

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
  void addHome({
    required String id,
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
  void updateHome({
    required String id,
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
  void removeHome({required String id}) {
    final home = repository.remove(id);
    if (home != null) {
      eventSink.emit(HomeRemovedEvent(home));
    }
  }

  @override
  void confirmHome({required String id}) {
    final home = repository.get(id);
    if (home != null) {
      eventSink.emit(HomeRenewEvent(home));
    }
  }
}
