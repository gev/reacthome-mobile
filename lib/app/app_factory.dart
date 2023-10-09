import 'package:flutter/widgets.dart';
import 'package:reacthome/app/app.android.dart';
import 'package:reacthome/app/app.ios.dart';
import 'package:reacthome/navigation/navigation.dart';
import 'package:reacthome/domains/discovery/discovery.dart';
import 'package:reacthome/platform/platform.dart';

class AppFactory {
  static const instance = AppFactory._();
  const AppFactory._();

  Widget make({required Discovery discovery, required Navigation navigation}) =>
      selectPlatform(
        ios: AppIOS(discovery, navigation),
        android: AppAndroid(discovery, navigation),
      );
}
