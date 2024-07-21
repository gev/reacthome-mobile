import 'package:reacthome/controllers/reacthome/home/home_controller.dart';
import 'package:reacthome/controllers/reacthome/reacthome_controller.dart';
import 'package:reacthome/controllers/reacthome/reacthome_inbound_controller.dart';
import 'package:reacthome/make/core/home_factory.dart';

class ReacthomeControllerFactory {
  static final controllerRepository = <String, ReacthomeController>{};

  static ReacthomeInboundController make() => ReacthomeInboundController(
        repository: controllerRepository,
      );

  static Future<HomeController> makeHomeController() async =>
      HomeController(home: await HomeFactory.makeHomeApi());
}
