import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/screens/home/home_screen.android.dart';
import 'package:reacthome/ui/screens/home/home_screen.ios.dart';
import 'package:reacthome/util/platform.dart';

class HomeScreen {
  static Widget make({
    String title = 'Home',
    required Widget left,
    required Widget right,
  }) =>
      selectPlatform(
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
