import 'package:reacthome/features/discovery/infrasstructure/discovery_controller.dart';

class Discovery {
  static final instance = Discovery._();

  late DiscoveryController controller;

  Discovery._() {
    controller = DiscoveryController();
  }
}
