import 'package:flutter/widgets.dart';

class NavigationRouteNames {
  static const splash = 'splash';
  static const home = '/';
}

class Navigation {
  final WidgetBuilder home;
  final WidgetBuilder splash;

  const Navigation({required this.home, required this.splash});

  String get initialRoute => NavigationRouteNames.home;

  Map<String, WidgetBuilder> get routes => ({
        NavigationRouteNames.splash: splash,
        NavigationRouteNames.home: home,
      });
}
