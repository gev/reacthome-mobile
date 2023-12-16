import 'package:flutter/widgets.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/features/app_life_cycle_factory.dart';
import 'package:reacthome/app/ui/screens/home_screen_factory.dart';
import 'package:reacthome/app/ui/screens/splash_screen_factory.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';

Widget make() => App.make(
    theme: Config.theme,
    appLifeCycle: AppLifecycleFactory.instance.appLifecycleService,
    navigation: Navigation(
      splash: SplashScreenFactory.instance.screen,
      home: HomeScreenFactory.instance.screen,
    ));
