import 'package:flutter/widgets.dart';
import 'package:reacthome/app/app_life_cycle.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/ui.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';

Widget make() => makeApp(
    theme: Config.theme,
    appLifeCycle: AppLifecycle.instance.appLifecycleService,
    navigation: Navigation(
      home: UI.instance.homeScreen,
    ));
