import 'package:flutter/widgets.dart';
import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/discovery.dart';
import 'package:reacthome/app/ui.dart';
import 'package:reacthome/ui/app/app.dart';
import 'package:reacthome/ui/app/navigation.dart';

Widget make() => makeApp(
    theme: Config.theme,
    discovery: Discovery.instance.model,
    navigation: Navigation(
      home: UI.instance.homeScreen,
    ));
