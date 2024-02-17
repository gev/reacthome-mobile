import 'package:flutter/cupertino.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_command.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/ui/theme_config.dart';

class App extends StatelessWidget with WidgetsBindingObserver {
  final AppLifecycleCommand appLifeCycle;
  final ThemeConfig theme;
  final Navigation navigation;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final String title;

  App({
    required this.appLifeCycle,
    required this.theme,
    required this.navigation,
    required this.localizationsDelegates,
    required this.supportedLocales,
    this.title = 'Reacthome',
    super.key,
  }) {
    WidgetsBinding.instance.addObserver(this);
    appLifeCycle.makeActive();
  }

  @override
  Widget build(BuildContext context) {
    return app.root(
      theme: theme,
      navigation: navigation,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      title: title,
    );
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
