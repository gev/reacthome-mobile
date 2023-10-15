import 'package:reacthome/domains/discovery/discovery_model.dart';
import 'package:reacthome/services/discovery/discovery_config.dart';
import 'package:reacthome/services/discovery/discovery_controller.dart';
import 'package:reacthome/services/discovery/discovery_service.dart';
import 'package:reacthome/services/discovery/discovery_socket_controller.dart';
import 'package:reacthome/services/discovery/discovery_socket_fabric.dart';
import 'package:reacthome/utils/event_bus.dart';

DiscoveryService makeDiscoveryService({
  required DiscoveryConfig config,
  required EventBus<DiscoveryEvent> eventBus,
  required DiscoveryModel model,
}) {
  final service = DiscoveryService(eventBus, model);
  DiscoveryController(
    eventBus,
    service,
    DiscoverySocketFabric(
      config,
      DiscoverySocketController(service),
    ),
  );
  return service;
}
