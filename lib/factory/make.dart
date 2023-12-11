import 'package:flutter/widgets.dart';
import 'package:reacthome/factory/config.dart';
import 'package:reacthome/factory/features/app_life_cycle_factory.dart';
import 'package:reacthome/factory/ui/screens/home_screen_factory.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';

Widget make() => App.make(
    theme: Config.theme,
    appLifeCycle: AppLifecycleFactory.instance.appLifecycleService,
    navigation: Navigation(
      home: HomeScreenFactory.instance.screen,
    ));
