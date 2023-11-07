import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_panel.dart';
import 'package:reacthome/ui/screens/home/home_screen.android.dart';
import 'package:reacthome/ui/screens/home/home_screen.ios.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/platform.dart';

Widget makeHomeScreen({
  required ({
    EventBus<DaemonEvent> eventBus,
    DaemonQuery query,
    DaemonCommand actor,
  }) discovery,
  required ({
    EventBus<DaemonEvent> eventBus,
    DaemonQuery query,
    DaemonCommand actor,
  }) daemon,
  String title = 'Home',
}) {
  final left = daemonPanel(discovery);
  final right = daemonPanel(daemon);
  return selectPlatform(
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
  );
}
