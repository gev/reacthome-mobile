import 'dart:io';

import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/home/domain/home_entity.dart';
import 'package:reacthome/infrastructure/bus/bus_emitter.dart';
import 'package:reacthome/infrastructure/repository/repository.dart';

class HomeService extends GenericBusEmitter<HomeEvent> implements HomeApi {
  final Repository<String, HomeEntity> repository;

  const HomeService({
    required super.eventSink,
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

  // TODO: move to a usecase
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
      emit(HomeAddedEvent(home));
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

  // TODO: move to a usecase
  @override
  void removeHome({required String id}) {
    final home = repository.remove(id);
    if (home != null) {
      emit(HomeRemovedEvent(home));
    }
  }

  // TODO: move to a usecase
  @override
  void confirmHome({required String id}) {
    final home = repository.get(id);
    if (home != null) {
      emit(HomeRenewEvent(home));
    }
  }
}