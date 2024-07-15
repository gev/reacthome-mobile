import 'package:reacthome/application/home_connection/active_connection_service.dart';
import 'package:reacthome/application/home_connection/home_connection_api.dart';
import 'package:reacthome/application/home_connection/home_connection_entity.dart';
import 'package:reacthome/application/home_connection/home_connection_service.dart';
import 'package:reacthome/entity_framework/infrastructure/repository/map_repository.dart';
import 'package:reacthome/infrastructure/home_connection/home_connection_connectivity_service.dart';
import 'package:reacthome/infrastructure/home_connection/home_connection_lifecycle_service.dart';
import 'package:reacthome/infrastructure/home_connection/home_connection_registry_service.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/make/application/app_life_cycle_factory.dart';
import 'package:reacthome/make/application/connection_factory.dart';
import 'package:reacthome/make/application/connectivity_factory.dart';
import 'package:reacthome/make/config.dart';
import 'package:reacthome/make/domain/home_factory.dart';

class HomeConnectionFactory {
  static final instance = HomeConnectionFactory._();

  HomeConnectionFactory._();

  final _repository = MapRepository<String, HomeConnectionEntity<WebSocket>>();

  HomeConnectionApi makeHomeConnectionService() {
    final localConnectionService =
        ConnectionFactory.instance.makeLocalConnectionService();

    final cloudConnectionService =
        ConnectionFactory.instance.makeCloudConnectionService();

    return HomeConnectionService<WebSocket>(
      eventSink: ConnectionFactory.instance.connectionEventBus.sink,
      local: localConnectionService,
      cloud: cloudConnectionService,
      repository: _repository,
    );
  }

  ActiveConnectionService makeActiveConnectionService() =>
      ActiveConnectionService(
        eventSource: ConnectionFactory.instance.connectionEventBus.stream,
        connection: makeHomeConnectionService(),
      );

  Future<HomeConnectionRegistryService> makeHomeConnectionAutoService() async =>
      HomeConnectionRegistryService(
        eventSource: HomeFactory.instance.homeEventBus.stream,
        home: await HomeFactory.instance.makeHomeService(),
        connection: makeHomeConnectionService(),
      );

  Future<HomeConnectionLifecycleService>
      makeHomeConnectionLifecycleService() async =>
          HomeConnectionLifecycleService(
            eventSource:
                AppLifecycleFactory.instance.appLifecycleEventBus.stream,
            home: await HomeFactory.instance.makeHomeService(),
            connection: makeHomeConnectionService(),
            connectivity:
                ConnectivityFactory.instance.makeConnectivityService(),
            reconnectTimeout: Config.connection.reconnectTimeout,
          );

  Future<HomeConnectionConnectivityService>
      makeHomeConnectionConnectivityService() async =>
          HomeConnectionConnectivityService(
            eventSource:
                ConnectivityFactory.instance.connectivityEventBus.stream,
            home: await HomeFactory.instance.makeHomeService(),
            connection: makeHomeConnectionService(),
          );
}
