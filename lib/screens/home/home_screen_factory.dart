import 'package:flutter/widgets.dart';
import 'package:reacthome/domains/discovery/discovery.dart';
import 'package:reacthome/screens/home/home_screen.android.dart';
import 'package:reacthome/screens/home/home_screen.ios.dart';
import 'package:reacthome/platform/platform.dart';

class HomeScreenFactory {
  static const instance = HomeScreenFactory._();
  const HomeScreenFactory._();

  Widget make({required Discovery discovery, required String title}) =>
      selectPlatform(
        ios: HomeScreenIOS(title: title),
        android: HomeScreenAndroid(title: title),
      );
}
