import 'package:reacthome/app/discovery.dart';
import 'package:reacthome/ui/screens/home/home_screen.dart';

class UI {
  static final instance = UI._();

  UI._();

  final homeScreen = makeHomeScreen(
    eventBus: Discovery.instance.eventBus,
    discovery: Discovery.instance.model,
  );
}
