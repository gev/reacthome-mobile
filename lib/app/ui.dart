import 'package:reacthome/app/connection.dart';
import 'package:reacthome/app/daemon.dart';
import 'package:reacthome/app/daemon_connection.dart';
import 'package:reacthome/app/discovery.dart';
import 'package:reacthome/ui/screens/home/home_screen.dart';

class UI {
  static final instance = UI._();

  UI._();

  final homeScreen = makeHomeScreen(
    connection: (eventBus: Connection.instance.connectionEventBus,),
    daemonConnection: (
      query: DaemonConnection.instance.daemonConnectionService,
      actor: DaemonConnection.instance.daemonConnectionService,
    ),
    local: (query: Connection.instance.localConnectionService,),
    cloud: (query: Connection.instance.cloudConnectionService,),
    daemonDiscovery: (
      eventBus: Discovery.instance.daemonEventBus,
      query: Discovery.instance.daemonService,
      actor: Discovery.instance.daemonService,
    ),
    daemonSelect: (
      eventBus: Daemon.instance.daemonEventBus,
      query: Daemon.instance.daemonService,
      actor: Daemon.instance.daemonService,
    ),
    discoveryProcess: (
      eventBus: Discovery.instance.discoveryEventBus,
      query: Discovery.instance.discoveryService,
      actor: Discovery.instance.discoveryService,
    ),
  );
}
