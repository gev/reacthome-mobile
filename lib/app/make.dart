import 'package:flutter/widgets.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/features/app_life_cycle.dart';
import 'package:reacthome/app/ui/screens/home.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';

Widget make() => App.make(
    theme: Config.theme,
    appLifeCycle: AppLifecycle.instance.appLifecycleService,
    navigation: Navigation(
      home: Home.instance.screen,
    ));
