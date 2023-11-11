import 'package:reacthome/core/connection/connection_command.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/infrastructure/websocket/websocket_factory.dart';
import 'package:reacthome/util/event_listener.dart';

class WebsocketService extends EventListener<ConnectionEvent> {
  final ConnectionCommand actor;
  final WebSocketFactory factory;

  WebsocketService({
    required super.eventSource,
    required this.actor,
    required this.factory,
  });

  @override
  void handle(ConnectionEvent event) {
    switch (event) {
      case ConnectionEventConnectRequested _:
        _connect();
      case ConnectionEventConnectCompleted _:
        _complete();
      case ConnectionEventRejected _:
        _reject();
      case ConnectionEventDisconnectedRequested _:
        _disconnect();
      case ConnectionEventDisconnectCompleted _:
        _complete();
    }
  }

  void _connect() {}

  void _complete() {}

  void _reject() {}

  void _disconnect() {}
}
