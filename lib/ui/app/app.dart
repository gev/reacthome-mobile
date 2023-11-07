import 'package:flutter/widgets.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_command.dart';
import 'package:reacthome/ui/app/app.android.dart';
import 'package:reacthome/ui/app/app.ios.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';
import 'package:reacthome/util/platform.dart';

Widget makeApp({
  required ThemeConfig theme,
  required AppLifecycleCommand appLifeCycle,
  required Navigation navigation,
  String title = 'Reacthome',
}) =>
    selectPlatform(
      ios: () => AppIOS(theme, navigation, title, actor: appLifeCycle),
      android: () => AppAndroid(theme, navigation, title, actor: appLifeCycle),
    );
