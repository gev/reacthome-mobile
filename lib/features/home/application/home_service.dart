import 'dart:io';

import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/home/domain/home_entity.dart';
import 'package:reacthome/util/bus/bus_emitter.dart';
import 'package:reacthome/util/repository/repository.dart';

class HomeService extends GenericBusEmitter<HomeEvent> implements HomeApi {
  final Repository<String, HomeEntity> repository;

  const HomeService({
    required super.eventSink,
    required this.repository,
  });

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
      repository.add(home);
      emit(HomeAddedEvent(id));
    } else {
      home.update(meta, address, project).forEach(emit);
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
      home.update(meta, address, project).forEach(emit);
    }
  }

  @override
  void removeHome({required String id}) {
    if (repository.has(id)) {
      repository.remove(id);
      emit(HomeRemovedEvent(id));
    }
  }

  @override
  void confirmHome({required String id}) {
    emit(HomeRenewEvent(id));
  }
}
