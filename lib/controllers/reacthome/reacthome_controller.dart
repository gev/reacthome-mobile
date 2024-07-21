import 'package:reacthome/common/handler.dart';
import 'package:reacthome/controllers/reacthome/reacthome.dart';
import 'package:reacthome/controllers/reacthome/reacthome_action.dart';
import 'package:reacthome/controllers/reacthome/reacthome_action_dto.dart';

class ReacthomeController implements Handler<String> {
  final Map<String, Reacthome> repository;

  const ReacthomeController({required this.repository});

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
