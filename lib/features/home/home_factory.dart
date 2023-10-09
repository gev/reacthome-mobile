import 'package:flutter/widgets.dart';
import 'package:reacthome/features/discovery/discovery.dart';
import 'package:reacthome/features/home/home.android.dart';
import 'package:reacthome/features/home/home.ios.dart';
import 'package:reacthome/platform/platform.dart';

class HomeFactory {
  static const instance = HomeFactory._();
  const HomeFactory._();

  Widget make({required Discovery discovery, String title = 'Home'}) =>
      selectPlatform(
        ios: HomePageIOS(title: title),
        android: HomePageAndroid(title: title),
      );
}
