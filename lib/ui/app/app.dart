import 'package:flutter/widgets.dart';
import 'package:reacthome/features/discovery/discovery_model.dart';
import 'package:reacthome/ui/app/app.android.dart';
import 'package:reacthome/ui/app/app.ios.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';
import 'package:reacthome/util/platform.dart';

Widget makeApp({
  required ThemeConfig theme,
  required DiscoveryModel discovery,
  required Navigation navigation,
  String title = 'Reacthome',
}) =>
    selectPlatform(
      ios: AppIOS(theme, navigation, title, discovery),
      android: AppAndroid(theme, navigation, title, discovery),
    );
