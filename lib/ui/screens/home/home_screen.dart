import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.android.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.ios.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_panel.dart';
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
    ios: HomeScreenViewIOS(
      title: title,
      left: left,
      right: right,
    ),
    android: HomeScreenViewAndroid(
      title: title,
      left: left,
      right: right,
    ),
  );
}
