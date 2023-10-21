import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.android.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.ios.dart';
import 'package:reacthome/ui/screens/home/home_screen_view_model.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/platform.dart';

Widget makeHomeScreen({
  required Bus<DiscoveryEvent> eventBus,
  required DiscoveryService discovery,
  String title = 'Home',
}) {
  final viewModel = HomeScreenViewModel(discovery, eventSource: eventBus);
  return ChangeNotifierProvider(
    create: (_) => viewModel,
    child: selectPlatform(
      ios: HomeScreenViewIOS(title: title),
      android: HomeScreenViewAndroid(title: title),
    ),
  );
}
