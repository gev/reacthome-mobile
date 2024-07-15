import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/core/home_connection/home_connection_entity.dart';
import 'package:reacthome/core/home_connection/home_connection_service.dart';
import 'package:reacthome/infrastructure/repository/map_repository.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/make/core/connection_factory.dart';

class HomeConnectionFactory {
  HomeConnectionFactory._();

  static final _repository =
      MapRepository<String, HomeConnectionEntity<WebSocket>>();

  static HomeConnectionApi makeHomeConnectionApi() =>
      HomeConnectionService<WebSocket>(
        eventSink: ConnectionFactory.connectionEventBus.sink,
        local: ConnectionFactory.makeLocalConnectionApi(),
        cloud: ConnectionFactory.makeCloudConnectionApi(),
        repository: _repository,
      );
}
