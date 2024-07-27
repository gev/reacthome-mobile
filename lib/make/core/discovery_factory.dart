import 'package:reacthome/common/bus/bus.dart';
import 'package:reacthome/core/discovery/discovery.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_service.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_entity.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/home/home_service.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/repository/memory_map_repository.dart';

class DiscoveryFactory {
  DiscoveryFactory._();

  static final _repository = MemoryMapRepository<String, HomeEntity>();

  static final _discovery = Discovery<MulticastSource>();

  static final homeEventBus = Bus<HomeEvent>();

  static final discoveryEventBus = Bus<DiscoveryEvent>();

  static HomeApi makeHomeApi() => HomeService(
        eventSink: homeEventBus.sink,
        repository: _repository,
      );

  static DiscoveryApi<MulticastSource> makeDiscoveryApi() => DiscoveryService(
        eventSink: discoveryEventBus.sink,
        discovery: _discovery,
      );
}
