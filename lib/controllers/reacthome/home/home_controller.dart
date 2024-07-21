import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/controllers/reacthome/home/home_action_dto.dart';
import 'package:reacthome/controllers/reacthome/reacthome.dart';
import 'package:reacthome/controllers/reacthome/reacthome_action.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta/meta.dart';
import 'package:reacthome/util/extensions.dart';

class HomeController extends BusListener<HomeEvent> implements Reacthome {
  final HomeApi home;
  final Map<String, Reacthome> repository;

  HomeController({
    required super.eventSource,
    required this.home,
    required this.repository,
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

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeAddedEvent e:
        repository[e.home.id] = this;
      case HomeRemovedEvent e:
        repository.remove(e.home.id);
      default:
    }
  }
}
