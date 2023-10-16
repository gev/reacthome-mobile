import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/features/discovery/discovery_model.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.android.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.ios.dart';
import 'package:reacthome/ui/screens/home/home_screen_view_model.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/platform.dart';

Widget makeHomeScreen({
  required EventBus<DiscoveryEvent> eventBus,
  required DiscoveryModel discovery,
  String title = 'Home',
}) {
  final viewModel = HomeScreenViewModel(discovery);
  viewModel.subscribe(eventBus);
  return ChangeNotifierProvider(
    create: (_) => viewModel,
    child: selectPlatform(
      ios: HomeScreenViewIOS(title: title),
      android: HomeScreenViewAndroid(title: title),
    ),
  );
}
