import 'package:reacthome/common/bus/bus.dart';
import 'package:reacthome/common/entity_event.dart';
import 'package:reacthome/common/repository/map_repository.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_dto.dart';
import 'package:reacthome/core/home/home_entity.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/home/home_service.dart';
import 'package:reacthome/infrastructure/repository/cached_map_repository.dart';
import 'package:reacthome/infrastructure/repository/persistent_map_repository.dart';

class HomeFactory {
  HomeFactory._();

  static final entityEventBus = Bus<EntityEvent>();
  static final homeEventBus = Bus<HomeEvent>();

  static Future<MapRepository<String, HomeEntity>> makeHomeRepository() async =>
      CachedMapRepository(
        repository: await PersistentMapRepository.make(
          name: 'home',
          scope: 'reacthome',
          fromJson: (json) => HomeDto.fromJson(json),
          toJson: (entity) => HomeDto.toJson(entity),
        ),
        eventSink: entityEventBus.sink,
      );

  static Future<HomeApi> makeHomeApi() async => HomeService(
        eventSink: homeEventBus.sink,
        repository: await makeHomeRepository(),
      );
}
