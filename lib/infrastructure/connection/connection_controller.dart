import 'package:reacthome/entity_framework/core/handler.dart';

class ConnectionController implements Handler<String> {
  const ConnectionController();

  @override
  void handle(String event) {
    print(event);
  }
}
