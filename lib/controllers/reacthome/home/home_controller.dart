import 'package:reacthome/controllers/reacthome/home/home_action_dto.dart';
import 'package:reacthome/controllers/reacthome/reacthome_action.dart';
import 'package:reacthome/controllers/reacthome/reacthome_controller.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/meta/meta.dart';
import 'package:reacthome/util/extensions.dart';

class HomeController implements ReacthomeController {
  final HomeApi home;

  HomeController({required this.home});

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
