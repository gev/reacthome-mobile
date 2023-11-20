import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/discovery_status_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen.android.dart';
import 'package:reacthome/ui/screens/home/home_screen.ios.dart';
import 'package:reacthome/util/factory.dart';
import 'package:reacthome/util/platform.dart';

Widget makeHomeScreen({
  String title = 'Home',
  required Widget left,
  required Widget right,
  required Factory<DiscoveryStatusViewModel> discoveryStatusViewModelFactory,
}) {
  return ChangeNotifierProvider(
    create: discoveryStatusViewModelFactory.create,
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
