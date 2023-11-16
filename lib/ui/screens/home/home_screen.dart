import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_query.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_command.dart';
import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_query.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_panel.dart';
import 'package:reacthome/ui/fragments/discovery/discovery_status_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen.android.dart';
import 'package:reacthome/ui/screens/home/home_screen.ios.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/platform.dart';

Widget makeHomeScreen({
  required ({
    EventBus<ConnectionEvent> eventBus,
  }) connection,
  required ({
    ConnectionQuery<DaemonConnection> query,
    DaemonConnectionCommand actor,
  }) daemonConnection,
  required ({
    ConnectionQuery<Connection> query,
  }) local,
  required ({
    ConnectionQuery<Connection> query,
  }) cloud,
  required ({
    EventBus<DaemonEvent> eventBus,
    DaemonQuery query,
    DaemonCommand actor,
  }) daemonDiscovery,
  required ({
    EventBus<DaemonEvent> eventBus,
    DaemonQuery query,
    DaemonCommand actor,
  }) daemonSelect,
  required ({
    EventBus<DiscoveryEvent> eventBus,
    DiscoveryQuery query,
    DiscoveryCommand actor,
  }) discoveryProcess,
  String title = 'Home',
}) {
  final left = daemonPanel(
    connection: connection,
    daemonConnection: daemonConnection,
    local: local,
    cloud: cloud,
    daemon: daemonDiscovery,
  );
  final right = daemonPanel(
    connection: connection,
    daemonConnection: daemonConnection,
    local: local,
    cloud: cloud,
    daemon: daemonSelect,
  );
  discoveryVieModel(_) => DiscoveryStatusViewModel(
        eventSource: discoveryProcess.eventBus,
        query: discoveryProcess.query,
        actor: discoveryProcess.actor,
      );
  return ChangeNotifierProvider(
    create: discoveryVieModel,
    child: selectPlatform(
      ios: () => HomeScreenIOS(
        title: title,
        left: left,
        right: right,
      ),
      android: () => HomeScreenAndroid(
        title: title,
        left: left,
        right: right,
      ),
    ),
  );
}
