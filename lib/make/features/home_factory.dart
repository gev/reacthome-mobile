import 'package:reacthome/features/home/home_api.dart';
import 'package:reacthome/features/home/home_discovery_service.dart';
import 'package:reacthome/features/home/home_entity.dart';
import 'package:reacthome/features/home/home_event.dart';
import 'package:reacthome/features/home/home_service.dart';
import 'package:reacthome/infrastructure/bus/bus.dart';
import 'package:reacthome/infrastructure/repository/persistent_repository.dart';
import 'package:reacthome/make/features/discovery_factory.dart';
import 'package:reacthome/make/features/home_connection_factory.dart';

class HomeFactory {
  static final instance = HomeFactory._();

  HomeFactory._();

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

  Future<HomeDiscoveryService> makeHomeDiscoveryService() async =>
      HomeDiscoveryService(
        eventSource: DiscoveryFactory.instance.homeEventBus.stream,
        home: await makeHomeService(),
        connection: HomeConnectionFactory.instance.makeHomeConnectionApi(),
      );
}
