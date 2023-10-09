import 'package:flutter/widgets.dart';
import 'package:reacthome/app/app.android.dart';
import 'package:reacthome/app/app.ios.dart';
import 'package:reacthome/features/discovery/discovery.dart';
import 'package:reacthome/platform/platform.dart';

class AppFactory {
  static const instance = AppFactory._();
  const AppFactory._();

  Widget make({required Discovery discovery, required Widget home}) =>
      selectPlatform(
        ios: AppIOS(discovery: discovery, home: home),
        android: AppAndroid(discovery: discovery, home: home),
      );
}
