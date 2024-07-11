import 'package:reacthome/app/features/app_life_cycle_factory.dart';
import 'package:reacthome/app/features/connection_factory.dart';
import 'package:reacthome/app/features/connectivity_factory.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/features/home_connection/application/active_connection_service.dart';
import 'package:reacthome/features/home_connection/application/home_connection_auto_service.dart';
import 'package:reacthome/features/home_connection/application/home_connection_connectivity_service.dart';
import 'package:reacthome/features/home_connection/application/home_connection_lifecycle_service.dart';
import 'package:reacthome/features/home_connection/application/home_connection_service.dart';
import 'package:reacthome/features/home_connection/domain/home_connection_entity.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/util/repository.dart';

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

  HomeConnectionAutoService makeHomeConnectionAutoService() =>
      HomeConnectionAutoService(
        eventSource: HomeFactory.instance.homeEventBus.stream,
        home: HomeFactory.instance.makeHomeService(),
        connection: makeHomeConnectionService(),
      );

  HomeConnectionLifecycleService makeHomeConnectionLifecycleService() =>
      HomeConnectionLifecycleService(
        eventSource: AppLifecycleFactory.instance.appLifecycleEventBus.stream,
        home: HomeFactory.instance.makeHomeService(),
        connection: makeHomeConnectionService(),
      );

  HomeConnectionConnectivityService makeHomeConnectionConnectivityService() =>
      HomeConnectionConnectivityService(
        eventSource: ConnectivityFactory.instance.connectivityEventBus.stream,
        home: HomeFactory.instance.makeHomeService(),
        connection: makeHomeConnectionService(),
      );
}
