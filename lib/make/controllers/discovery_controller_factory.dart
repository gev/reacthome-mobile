import 'package:reacthome/controllers/discovery/discovery_controller.dart';
import 'package:reacthome/make/core/discovery_factory.dart';

class DiscoveryControllerFactory {
  static DiscoveryController make() => DiscoveryController(
        homeApi: DiscoveryFactory.makeHomeApi(),
      );
}
