import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/screen/screen.android.dart';
import 'package:reacthome/ui/widgets/screen/screen.ios.dart';
import 'package:reacthome/util/platform.dart';

class Screen {
  static Widget make({required Widget body}) => selectPlatform(
        ios: () => ScreenIOS(body: body),
        android: () => ScreenAndroid(body: body),
      );
}

class TitleScreen {
  static Widget make({
    required String title,
    required Widget body,
  }) =>
      selectPlatform(
        ios: () => TitleScreenIOS(
          title: title,
          body: body,
        ),
        android: () => TitleScreenAndroid(
          title: title,
          body: body,
        ),
      );
}
