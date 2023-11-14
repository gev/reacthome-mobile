import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
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
    EventBus<DiscoveryEvent> eventBus,
    DiscoveryQuery query,
    DiscoveryCommand actor,
  }) discoveryProcess,
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
  String title = 'Home',
}) {
  final left = daemonPanel(daemonDiscovery);
  final right = daemonPanel(daemonSelect);
  return ChangeNotifierProvider(
    create: (_) => DiscoveryStatusViewModel(
      eventSource: discoveryProcess.eventBus,
      query: discoveryProcess.query,
      actor: discoveryProcess.actor,
    ),
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
