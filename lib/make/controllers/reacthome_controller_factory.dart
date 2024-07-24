import 'package:reacthome/controllers/reacthome/home/home_controller.dart';
import 'package:reacthome/controllers/reacthome/reacthome_controller.dart';
import 'package:reacthome/controllers/reacthome/reacthome_inbound_controller.dart';
import 'package:reacthome/make/core/home_factory.dart';

class ReacthomeControllerFactory {
  static final controllers = <String, ReacthomeController>{};

  static ReacthomeInboundController make() =>
      ReacthomeInboundController(controllers);

  static Future<HomeController> makeHomeController() async => HomeController(
        controllers: controllers,
        eventSource: HomeFactory.entityEventBus.stream,
        homeApi: await HomeFactory.makeHomeApi(),
      );

  static Future<void> makeControllers() async {
    await makeHomeController();
  }
}
