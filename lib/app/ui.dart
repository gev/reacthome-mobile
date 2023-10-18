import 'package:reacthome/app/discovery_process.dart';
import 'package:reacthome/ui/screens/home/home_screen.dart';

class UI {
  static final instance = UI._();

  UI._();

  final homeScreen = makeHomeScreen(
    eventBus: DiscoveryProcess.instance.eventBus,
    discovery: DiscoveryProcess.instance.service,
  );
}
