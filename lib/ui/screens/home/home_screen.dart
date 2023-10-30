import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_query.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_tile_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.android.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.ios.dart';
import 'package:reacthome/ui/screens/home/home_screen_view_model.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/platform.dart';

Widget makeHomeScreen({
  required EventBus<DiscoveryEvent> eventBus,
  required DiscoveryQuery query,
  required DiscoveryCommand actor,
  String title = 'Home',
}) {
  final viewModel = HomeScreenViewModel(query, eventSource: eventBus);
  final daemonTileViewModel =
      HomeScreenDaemonTileViewModel(query, eventSource: eventBus);
  final addButtonViewModel = HomeScreenAddButtonViewModel(actor);
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => viewModel),
      ChangeNotifierProvider(create: (_) => daemonTileViewModel),
      ChangeNotifierProvider(create: (_) => addButtonViewModel),
    ],
    child: selectPlatform(
      ios: HomeScreenViewIOS(title: title),
      android: HomeScreenViewAndroid(title: title),
    ),
  );
}
