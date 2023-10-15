import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/services/discovery/discovery_service.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.android.dart';
import 'package:reacthome/ui/screens/home/home_screen_view.ios.dart';
import 'package:reacthome/platform/platform.dart';
import 'package:reacthome/ui/screens/home/home_screen_view_model.dart';
import 'package:reacthome/utils/event_bus.dart';

Widget makeHomeScreen({
  required EventBus<DiscoveryEvent> eventBus,
  required DiscoveryService discovery,
  String title = 'Home',
}) {
  return ChangeNotifierProvider(
    create: (_) => HomeScreenViewModel(eventBus, discovery),
    child: selectPlatform(
      ios: HomeScreenViewIOS(title: title),
      android: HomeScreenViewAndroid(title: title),
    ),
  );
}
