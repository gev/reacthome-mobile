import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/features/home/application/home_service.dart';
import 'package:reacthome/features/home/domain/home_entity.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/repository.dart';

class HomeFactory {
  static final instance = HomeFactory._();

  HomeFactory._();

  final _repository = ImmutableMapRepository<String, HomeEntity>();

  final homeEventBus = Bus<HomeEvent>();

  HomeApi makeHomeService() => HomeService(
        eventSink: homeEventBus.sink,
        repository: _repository,
      );
}
