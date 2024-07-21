import 'package:reacthome/controllers/reacthome/home/home_controller.dart';
import 'package:reacthome/controllers/reacthome/reacthome.dart';
import 'package:reacthome/controllers/reacthome/reacthome_controller.dart';
import 'package:reacthome/make/core/home_factory.dart';

class ReacthomeControllerFactory {
  static final controllerRepository = <String, Reacthome>{};

  static ReacthomeController make() => ReacthomeController(
        repository: controllerRepository,
      );

  static Future<HomeController> makeHomeController() async => HomeController(
        eventSource: HomeFactory.homeEventBus.stream,
        home: await HomeFactory.makeHomeApi(),
        repository: controllerRepository,
      );

  static Future<void> makeControllers() async {
    await makeHomeController();
  }
}
