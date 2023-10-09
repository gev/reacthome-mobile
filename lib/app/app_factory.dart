import 'package:flutter/widgets.dart';
import 'package:reacthome/app/app.android.dart';
import 'package:reacthome/app/app.ios.dart';
import 'package:reacthome/domains/discovery/discovery.dart';
import 'package:reacthome/platform/platform.dart';

class AppFactory {
  static const instance = AppFactory._();
  const AppFactory._();

  Widget make({required Discovery discovery, required Widget homeScreen}) =>
      selectPlatform(
        ios: AppIOS(discovery: discovery, home: homeScreen),
        android: AppAndroid(discovery: discovery, home: homeScreen),
      );
}
