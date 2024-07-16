import 'package:reacthome/common/handler.dart';

class ReacthomeController implements Handler<String> {
  const ReacthomeController();

  @override
  void handle(String event) {
    print(event);
  }
}
