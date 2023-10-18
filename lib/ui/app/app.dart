import 'package:flutter/widgets.dart';
import 'package:reacthome/features/app_lifecycle/application/app_lifecycle_service.dart';
import 'package:reacthome/ui/app/app.android.dart';
import 'package:reacthome/ui/app/app.ios.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';
import 'package:reacthome/util/platform.dart';

Widget makeApp({
  required ThemeConfig theme,
  required AppLifecycleService appLifeCycle,
  required Navigation navigation,
  String title = 'Reacthome',
}) =>
    selectPlatform(
      ios: AppIOS(theme, navigation, title, appLifeCycle: appLifeCycle),
      android: AppAndroid(theme, navigation, title, appLifeCycle: appLifeCycle),
    );
