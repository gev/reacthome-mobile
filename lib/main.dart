import 'package:flutter/widgets.dart';
import 'package:reacthome/domains/discovery/discovery_model.dart';
import 'package:reacthome/services/discovery/discovery.dart';
import 'package:reacthome/services/discovery/discovery_service.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/config.dart';
import 'package:reacthome/ui/screens/home/home_screen.dart';
import 'package:reacthome/utils/event_bus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final discoveryEventBus = EventBus<DiscoveryEvent>();
  final discoveryService = makeDiscoveryService(
    config: Config.discovery,
    eventBus: discoveryEventBus,
    model: DiscoveryModel(),
  );
  runApp(makeApp(
    theme: Config.theme,
    discovery: discoveryService,
    navigation: Navigation(
      home: makeHomeScreen(
        eventBus: discoveryEventBus,
        discovery: discoveryService,
      ),
    ),
  ));
}
