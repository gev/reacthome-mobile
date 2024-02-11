import 'package:flutter/widgets.dart';

class NavigationRouteNames {
  static const splash = 'splash';
  static const welcome = 'welcome';
  static const discovery = 'discovery';
}

class Navigation {
  final WidgetBuilder splash;
  final WidgetBuilder welcome;
  final WidgetBuilder discovery;

  const Navigation({
    required this.splash,
    required this.welcome,
    required this.discovery,
  });

  String get initialRoute => NavigationRouteNames.splash;

  Map<String, WidgetBuilder> get routes => ({
        NavigationRouteNames.splash: splash,
        NavigationRouteNames.welcome: welcome,
        NavigationRouteNames.discovery: discovery,
      });
}
