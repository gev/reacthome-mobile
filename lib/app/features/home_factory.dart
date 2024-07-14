import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/features/home/application/home_service.dart';
import 'package:reacthome/features/home/domain/home_entity.dart';
import 'package:reacthome/util/bus/bus.dart';
import 'package:reacthome/util/repository/persistent_repository.dart';

class HomeFactory {
  static final instance = HomeFactory._();

  HomeFactory._();

  // final _repository = MapRepository<String, HomeEntity>();

  Future<PersistentRepository<HomeEntity>> makeHomeRepository() async =>
      PersistentRepository.make(
        name: 'home',
        scope: 'reacthome',
        fromJson: (json) => HomeEntity.fromJson(json),
        toJson: (entity) => entity.toJson(),
      );

  final homeEventBus = Bus<HomeEvent>();

  Future<HomeApi> makeHomeService() async => HomeService(
        eventSink: homeEventBus.sink,
        repository: await makeHomeRepository(),
      );
}
