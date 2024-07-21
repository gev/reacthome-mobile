import 'package:reacthome/controllers/reacthome/entity_controller.dart';
import 'package:reacthome/controllers/reacthome/home/home_action_dto.dart';
import 'package:reacthome/controllers/reacthome/reacthome_action.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/meta/meta.dart';
import 'package:reacthome/util/extensions.dart';

class HomeController extends EntityController {
  final HomeApi home;

  HomeController({
    required super.eventSource,
    required super.controllers,
    required this.home,
  });

  @override
  void executeAction(ReacthomeActionSet action) =>
      HomeActionDto.fromJSON(action.payload)?.let((payload) {
        home.updateHome(
          action.id,
          meta: Meta(title: payload.title, code: payload.code),
          project: payload.project,
        );
      });
}
