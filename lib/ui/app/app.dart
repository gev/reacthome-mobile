import 'package:flutter/widgets.dart';
import 'package:reacthome/services/discovery/discovery_service.dart';
import 'package:reacthome/ui/app/app.android.dart';
import 'package:reacthome/ui/app/app.ios.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/app/theme_config.dart';
import 'package:reacthome/platform/platform.dart';

Widget makeApp({
  required ThemeConfig theme,
  required DiscoveryService discovery,
  required Navigation navigation,
  String title = 'Reacthome',
}) =>
    selectPlatform(
      ios: AppIOS(theme, navigation, title, discovery),
      android: AppAndroid(theme, navigation, title, discovery),
    );
