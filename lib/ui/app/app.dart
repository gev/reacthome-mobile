import 'package:flutter/cupertino.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_command.dart';
import 'package:reacthome/ui/app/app_cupertino.dart';
import 'package:reacthome/ui/app/app_material.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';
import 'package:reacthome/util/platform.dart';

class App extends PlatformWidget with WidgetsBindingObserver {
  final AppLifecycleCommand appLifeCycle;
  App({
    required this.appLifeCycle,
    required ThemeConfig theme,
    required Navigation navigation,
    required Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    required Iterable<Locale> supportedLocales,
    String title = 'Reacthome',
    super.key,
  }) : super(
          cupertino: AppCupertino.build(
            title,
            localizationsDelegates,
            supportedLocales,
            theme,
            navigation,
          ),
          material: AppMaterial.build(
            title,
            localizationsDelegates,
            supportedLocales,
            theme,
            navigation,
          ),
        ) {
    WidgetsBinding.instance.addObserver(this);
    appLifeCycle.makeActive();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        appLifeCycle.makeActive();
      case AppLifecycleState.paused:
        appLifeCycle.makeInactive();
      default:
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    appLifeCycle.makeInactive();
  }
}
