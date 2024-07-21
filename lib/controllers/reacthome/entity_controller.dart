import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/common/entity_event.dart';
import 'package:reacthome/controllers/reacthome/reacthome_controller.dart';

abstract class EntityController extends BusListener<EntityEvent>
    implements ReacthomeController {
  final Map<String, ReacthomeController> controllers;

  EntityController({
    required super.eventSource,
    required this.controllers,
  });

  @override
  void handle(EntityEvent event) {
    switch (event) {
      case EntityRegisteredEvent e:
        controllers[e.id] = this;
      case EntityPoolRegisteredEvent e:
        for (var id in e.ids) {
          controllers[id] = this;
        }
      case EntityUnregisteredEvent e:
        controllers.remove(e.id);
      case EntityPoolUnregisteredEvent e:
        for (var id in e.ids) {
          controllers.remove(id);
        }
    }
  }
}
