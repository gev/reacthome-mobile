import 'package:flutter/widgets.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_command.dart';
import 'package:reacthome/ui/app/app_cupertino.dart';
import 'package:reacthome/ui/app/app_material.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';
import 'package:reacthome/util/platform.dart';

class App extends PlatformWidget {
  App({
    required ThemeConfig theme,
    required AppLifecycleCommand appLifeCycle,
    required Navigation navigation,
    String title = 'Reacthome',
    super.key,
  }) : super(
          cupertino: (_) => AppCupertino(
            theme,
            navigation,
            title,
            actor: appLifeCycle,
          ),
          material: (_) => AppMaterial(
            theme,
            navigation,
            title,
            actor: appLifeCycle,
          ),
        );
}
