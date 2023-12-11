import 'package:flutter/widgets.dart';
import 'package:reacthome/factories/config.dart';
import 'package:reacthome/factories/features/app_life_cycle_factory.dart';
import 'package:reacthome/factories/ui/screens/home_screen_factory.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';

Widget make() => App.make(
    theme: Config.theme,
    appLifeCycle: AppLifecycleFactory.instance.appLifecycleService,
    navigation: Navigation(
      home: HomeScreenFactory.instance.screen,
    ));
