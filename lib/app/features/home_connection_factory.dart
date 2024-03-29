import 'package:reacthome/app/features/app_life_cycle_factory.dart';
import 'package:reacthome/app/features/connection_factory.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/features/home_connection/application/active_connection_service.dart';
import 'package:reacthome/features/home_connection/application/home_connection_auto_service.dart';
import 'package:reacthome/features/home_connection/application/home_connection_lifecycle_service.dart';
import 'package:reacthome/features/home_connection/application/home_connection_service.dart';
import 'package:reacthome/features/home_connection/domain/home_connection_entity.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/util/repository.dart';

class HomeConnectionFactory {
  static final instance = HomeConnectionFactory._();

  HomeConnectionFactory._();

  final _repository = MapRepository<String, HomeConnectionEntity>();

  HomeConnectionService<WebSocket> makeHomeConnectionService() {
    final localConnectionService =
        ConnectionFactory.instance.makeLocalConnectionService();

    final cloudConnectionService =
        ConnectionFactory.instance.makeCloudConnectionService();

    return HomeConnectionService(
      eventSink: ConnectionFactory.instance.connectionEventBus,
      local: localConnectionService,
      cloud: cloudConnectionService,
      repository: _repository,
    );
  }

  ActiveConnectionService makeActiveConnectionService() =>
      ActiveConnectionService(
        eventSource: ConnectionFactory.instance.connectionEventBus,
        connection: makeHomeConnectionService(),
      );

  HomeConnectionAutoService makeHomeConnectionAutoService() =>
      HomeConnectionAutoService(
        eventSource: DiscoveryFactory.instance.homeEventBus,
        home: DiscoveryFactory.instance.makeHomeService(),
        connection: makeHomeConnectionService(),
      );

  HomeConnectionLifecycleService makeHomeConnectionLifecycleService() =>
      HomeConnectionLifecycleService(
        eventSource: AppLifecycleFactory.instance.appLifecycleEventBus,
        home: DiscoveryFactory.instance.makeHomeService(),
        connection: makeHomeConnectionService(),
      );
}
