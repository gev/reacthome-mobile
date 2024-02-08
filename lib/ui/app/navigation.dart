import 'package:flutter/widgets.dart';

class NavigationRouteNames {
  static const splash = 'splash';
  static const welcome = 'welcome';
  static const discovery = 'discovery';
  static const home = '/';
}

class Navigation {
  final WidgetBuilder splash;
  final WidgetBuilder welcome;
  final WidgetBuilder discovery;
  final WidgetBuilder home;

  const Navigation({
    required this.splash,
    required this.welcome,
    required this.discovery,
    required this.home,
  });

  String get initialRoute => NavigationRouteNames.splash;

  Map<String, WidgetBuilder> get routes => ({
        NavigationRouteNames.home: home,
        NavigationRouteNames.splash: splash,
        NavigationRouteNames.welcome: welcome,
        NavigationRouteNames.discovery: discovery,
      });
}
