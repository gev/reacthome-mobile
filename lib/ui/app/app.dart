import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:reacthome/features/application/app_lifecycle/app_lifecycle_api.dart';
import 'package:reacthome/infrastructure/ui/kit/kit.dart';
import 'package:reacthome/make/config/theme_config.dart';
import 'package:reacthome/ui/app/navigation.dart';

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

  final _timer = _Wrapper<Timer>();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _timer.value?.cancel();
        appLifeCycle.makeActive();
      case AppLifecycleState.paused:
        _timer.value = Timer(const Duration(seconds: 10), () {
          appLifeCycle.makeInactive();
        });
      default:
    }
  }

  void dispose() {
    _timer.value?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    appLifeCycle.makeInactive();
  }
}

class _Wrapper<T> {
  T? value;
}
