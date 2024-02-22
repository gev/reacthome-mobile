import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/features/home/application/home_service.dart';
import 'package:reacthome/features/home/domain/home_entity.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/repository.dart';

class HomeFactory {
  static final instance = HomeFactory._();

  HomeFactory._();

  final _repository = ImmutableMapRepository<String, HomeEntity>();

  final homeEventBus = GenericEventBus<HomeEvent>();

  HomeService makeHomeService() => HomeService(
        eventSink: homeEventBus,
        repository: _repository,
      );
}
