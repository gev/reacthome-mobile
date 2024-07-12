import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_api.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/ui/theme_config.dart';

class App extends StatelessWidget with WidgetsBindingObserver {
  final AppLifecycleApi appLifeCycle;
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
    this.title = 'Reacthome X',
    super.key,
  }) {
    WidgetsBinding.instance.addObserver(this);
    appLifeCycle.makeActive();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.restoreSystemUIOverlays();
    return app.root(
      context,
      theme: theme,
      navigation: navigation,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      title: title,
    );
  }

  Timer? _timer;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _timer?.cancel();
        appLifeCycle.makeActive();
      case AppLifecycleState.paused:
        _timer = Timer(const Duration(seconds: 10), () {
          appLifeCycle.makeInactive();
        });
      default:
    }
  }

  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    appLifeCycle.makeInactive();
  }
}
