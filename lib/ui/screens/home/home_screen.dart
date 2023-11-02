import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_list_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_panel.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_tile_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.android.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.ios.dart';
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
  final left = panel(discovery);
  final right = panel(daemon);
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

Widget panel(
    ({
      EventBus<DaemonEvent> eventBus,
      DaemonQuery query,
      DaemonCommand actor,
    }) discovery) {
  final daemonListViewModel = HomeScreenDaemonListViewModel(discovery.query,
      eventSource: discovery.eventBus);
  final daemonTileViewModel = HomeScreenDaemonTileViewModel(discovery.query,
      eventSource: discovery.eventBus);
  final addButtonViewModel = HomeScreenAddButtonViewModel(discovery.actor);
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => daemonListViewModel),
      ChangeNotifierProvider(create: (_) => daemonTileViewModel),
      ChangeNotifierProvider(create: (_) => addButtonViewModel),
    ],
    child: const DaemonPanel(),
  );
}
