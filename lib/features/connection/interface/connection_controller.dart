import 'package:reacthome/util/handler.dart';

class ConnectionController implements Handler<String> {
  const ConnectionController();

  @override
  void handle(String event) {
    print(event);
  }
}
