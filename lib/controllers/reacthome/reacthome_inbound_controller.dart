import 'package:reacthome/common/handler.dart';
import 'package:reacthome/controllers/reacthome/reacthome_action.dart';
import 'package:reacthome/controllers/reacthome/reacthome_action_dto.dart';
import 'package:reacthome/controllers/reacthome/reacthome_controller.dart';

class ReacthomeInboundController implements Handler<String> {
  final Map<String, ReacthomeController> repository;

  const ReacthomeInboundController({required this.repository});

  @override
  void handle(String event) {
    final action = ReacthomeActionDto.fromString(event);
    switch (action) {
      case ReacthomeActionSet e:
        repository[e.id]?.executeAction(e);
      default:
    }
  }
}
