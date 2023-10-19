import 'package:reacthome/features/discovery/infrastructure/discovery_controller.dart';

class Discovery {
  static final instance = Discovery._();

  late DiscoveryController controller;

  Discovery._() {
    controller = DiscoveryController();
  }
}
