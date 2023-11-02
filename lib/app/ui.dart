import 'package:reacthome/app/daemon.dart';
import 'package:reacthome/app/discovery.dart';
import 'package:reacthome/ui/screens/home/home_screen.dart';

class UI {
  static final instance = UI._();

  UI._();

  final homeScreen = makeHomeScreen(
    discovery: (
      eventBus: Discovery.instance.daemonEventBus,
      query: Discovery.instance.daemonService,
      actor: Discovery.instance.daemonService,
    ),
    daemon: (
      eventBus: Daemon.instance.daemonEventBus,
      query: Daemon.instance.daemonService,
      actor: Daemon.instance.daemonService,
    ),
  );
}
