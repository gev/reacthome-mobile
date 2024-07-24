import 'dart:io';

import 'package:reacthome/common/emitter.dart';
import 'package:reacthome/common/repository.dart';
import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_entity.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta/meta.dart';

class HomeService implements HomeApi {
  final Emitter<HomeEvent> eventSink;
  final Repository<String, HomeEntity> repository;

  const HomeService({
    required this.eventSink,
    required this.repository,
  });

  @override
  Iterable<String> get homes => repository.keys;

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
      repository.put(home);
      eventSink.emit(HomeAddedEvent(id));
    } else {
      _update(home, meta, address, project);
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
      _update(home, meta, address, project);
    }
  }

  void _update(
    HomeEntity home,
    Meta meta,
    InternetAddress? address,
    String? project,
  ) {
    final evens = home.update(meta, address, project);
    if (evens.isNotEmpty) {
      repository.put(home);
      evens.forEach(eventSink.emit);
    }
  }

  @override
  void removeHome(String id) {
    final home = repository.remove(id);
    if (home != null) {
      eventSink.emit(HomeRemovedEvent(id));
    }
  }

  @override
  void confirmHome(String id) {
    final home = repository.get(id);
    if (home != null) {
      eventSink.emit(HomeRenewEvent(id));
    }
  }
}
